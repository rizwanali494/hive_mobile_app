import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/get_it/download_service_instance.dart';
import 'package:hive_mobile/app/get_it/event_bus_instance.dart';

import 'package:hive_mobile/app/get_it/isar_get_it_instance.dart';
import 'package:hive_mobile/app/get_it/shared_pref_instance.dart';
import 'package:hive_mobile/app/get_it/socket_service_instance.dart';

final _getIt = GetIt.instance;

Future<void> getItSetup() async {
  _getIt.allowReassignment = true;
  await registerIsarInstance();
  await registerSharedPrefInstance();
  await registerSocketInstance();
  await registerEventBusInstance();
  registerDownloadServiceInstance();
}
