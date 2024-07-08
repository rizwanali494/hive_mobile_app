import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/constants/environment.dart';
import 'package:hive_mobile/app/get_it/get_it_instances.dart';
import 'package:hive_mobile/app/navigation/router.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: Environment.fileName);
  await getItSetup();
  // runApp(const MyApp());
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://e7a7a12fbfaae8459e7c65430f087980@o4505232523853824.ingest.us.sentry.io/4506892514492416';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 0.5;
    },
    appRunner: () => runApp(MyApp()),
  );
  // try {
  //   int? test;
  //   test! + 3;
  // } catch (exception, stackTrace) {
  //   debugPrint("Catch Error");
  //   await Sentry.captureException(exception, stackTrace: stackTrace);
  // }
  // ;
  Map<Permission, PermissionStatus> statuses = await [
    Permission.photos,
    Permission.camera,
    Permission.storage,
  ].request();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => MaterialApp.router(
        routerConfig: goRouter,
        title: AppStrings.appName,
        showPerformanceOverlay: kProfileMode,
        theme: lightTheme,
        darkTheme: lightTheme,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
