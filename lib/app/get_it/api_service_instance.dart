import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/services/api_services/api_service_impl.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';

final _getIt = GetIt.instance;

void registerApiServiceInstance({String? token}) {
  _getIt.registerSingleton<ApiService>(ApiServiceImpl(token: token));
}
