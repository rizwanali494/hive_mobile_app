import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _getIt = GetIt.instance;

Future<void> registerSharedPrefInstance() async {
  final sharedPref = await SharedPreferences.getInstance();
  _getIt.registerSingleton<SharedPreferences>(sharedPref);
}
