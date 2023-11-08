import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/services/api_services/api_service_impl.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';

final _getIt = GetIt.instance;

Future<void> registerApiServiceInstance({String? token}) async {
  _getIt.registerSingleton<ApiService>(ApiServiceImpl(token: token));
}
