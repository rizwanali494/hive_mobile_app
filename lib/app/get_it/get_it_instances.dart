import 'package:get_it/get_it.dart';

import 'package:hive_mobile/app/get_it/isar_get_it_instance.dart';

final _getIt = GetIt.instance;

Future<void> getItSetup() async {
  _getIt.allowReassignment = true;
  await registerIsarInstance();
}
