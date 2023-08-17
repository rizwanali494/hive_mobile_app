import 'dart:developer';

import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';

class NewServiceRequestRepo {
  late ApiService apiService;

  NewServiceRequestRepo({required this.apiService});

  Future<void> requestNewService({required Map body}) async {
    var url = ApiEndpoints.serviceRequest;
    log(url.toString());
    await apiService.post(url: url, body: body);
  }
}
