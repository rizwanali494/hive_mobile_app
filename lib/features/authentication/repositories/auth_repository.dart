import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/services/api_services/api_service_impl.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  GetIt getIt = GetIt.I;
  late ApiService apiService;

  AuthRepository() {
    apiService = getIt.get<ApiServiceImpl>();
  }

  Future<http.Response> login(String url) async {
    try {
      var response = await apiService.get(url: url);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
