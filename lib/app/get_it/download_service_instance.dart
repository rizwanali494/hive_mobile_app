import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/services/download_service/download_service.dart';

final _getIt = GetIt.instance;

Future<void> registerDownloadServiceInstance() async {
  await _getIt.registerSingleton(DownloadService());
}
