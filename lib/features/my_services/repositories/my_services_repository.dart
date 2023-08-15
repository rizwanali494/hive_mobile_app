import 'dart:convert';

import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/extensions/api_query_params_extension.dart';
import 'package:hive_mobile/app/models/data/my_services_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';

abstract class MyServicesRepository {
  late ApiService apiService;

  MyServicesRepository({required this.apiService});

  Future<List<MyServicesModel>> getInitialServicesList({int? limit});

  Future<List<MyServicesModel>> getNextServicesList({int? offSet, int? limit});

  Future<void> read();
}

class MyServicesRepositoryImpl extends MyServicesRepository {
  MyServicesRepositoryImpl({required super.apiService});

  @override
  Future<List<MyServicesModel>> getInitialServicesList({int? limit}) async {
    var response = await apiService.get(
      url: ApiEndpoints.inbox.withOwnerObject.withPolls.withAttachments
          .withLimit(limit),
    );
    var result = jsonDecode(response.body);
    List items = result["results"] ?? [];
    return Future.value([]);
  }

  @override
  Future<List<MyServicesModel>> getNextServicesList(
      {int? offSet, int? limit}) async {
    var response = await apiService.get(
      url: ApiEndpoints.inbox.withOwnerObject.withPolls.withAttachments
          .withLimit(limit)
          .withOffSet(offSet),
    );
    var result = jsonDecode(response.body);

    return Future.value([]);
  }

  @override
  Future<void> read() async {}
}
