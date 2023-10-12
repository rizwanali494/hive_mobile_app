import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/extensions/list_extension.dart';
import 'package:hive_mobile/app/models/data/my_services_model.dart';
import 'package:hive_mobile/app/models/pagination_controller.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/view_models/base_api_vm.dart';
import 'package:hive_mobile/features/my_services/repositories/my_services_repository.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class ServiceScreenVM extends BaseApiVM<MyServicesModel> {
  void notifyListener() {
    notifyListeners();
  }

  void setServiceStatusLocally() {
    totalApproved = items
        .where(
          (element) =>
              element.state?.toLowerCase() == AppStrings.approved.toLowerCase(),
        )
        .length;
    totalPending = items
        .where(
          (element) =>
              element.state?.toLowerCase() == AppStrings.pending.toLowerCase(),
        )
        .length;
    totalRejected = items
        .where(
          (element) =>
              element.state?.toLowerCase() == AppStrings.rejected.toLowerCase(),
        )
        .length;
    notifyListeners();
  }

  int totalApproved = 0;
  int totalPending = 0;
  int totalRejected = 0;

  @override
  Future<void> refreshList() async {
    await Future.wait([
      getServicesStatus(),
      super.refreshList(),
    ]);
  }

  Future<void> getServicesStatus() async {
    try {
      var map = await myServicesRepository.getServicesStatus();
      totalApproved = map[AppStrings.approved.toLowerCase()] ?? 0;
      totalPending = map[AppStrings.pending.toLowerCase()] ?? 0;
      totalRejected = map[AppStrings.rejected.toLowerCase()] ?? 0;
      notifyListeners();
    } catch (e) {
      // TODO
      setServiceStatusLocally();
    }
  }

  @override
  Future<List<MyServicesModel>> fetchInitialItems() async {
    final list =
        await myServicesRepository.getInitialServicesList(limit: limit);
    return list;
  }

  @override
  Future<List<MyServicesModel>> fetchNextItems() async {
    final list = await myServicesRepository.getNextServicesList(
        limit: limit, offSet: offSet);
    return list;
  }

  late MyServicesRepository myServicesRepository;

  final apiService = GetIt.instance.get<ApiService>();

  @override
  void setRepoInstance() {
    myServicesRepository = MyServicesRepositoryImpl(apiService: apiService);
    getServicesStatus();
  }
}
