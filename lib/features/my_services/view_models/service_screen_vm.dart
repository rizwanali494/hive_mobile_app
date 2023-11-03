import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/my_services_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/services/local_services/isar_service.dart';
import 'package:hive_mobile/features/my_services/repositories/my_services_repository.dart';
import 'package:hive_mobile/features/my_services/view_models/all_service_request_vm.dart';
import 'package:hive_mobile/features/my_services/view_models/close_service_request_vm.dart';
import 'package:hive_mobile/features/my_services/view_models/open_service_request_vm.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

class ServiceScreenVM extends ChangeNotifier {
  void notifyListener() {
    notifyListeners();
  }

  ServiceScreenVM() {
    getServicesStatus();
  }

  int totalApproved = 0;
  int totalPending = 0;
  int totalRejected = 0;

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

  final localService = IsarService<MyServicesModel>();

  void setServiceStatusLocally() {
    totalApproved =
        localService.query().filter().not().stateEqualTo("PENDING").countSync();
    totalPending =
        localService.query().filter().stateEqualTo("PENDING").countSync();
    notifyListeners();
  }

  final apiService = GetIt.instance.get<ApiService>();

  late MyServicesRepository myServicesRepository =
      MyServicesRepositoryImpl(apiService: apiService);

  final pageController = PageController();

  final pages = {
    "All": 0,
    "Open": 1,
    "Closed": 2,
  };

  String? selectedFilter = "All";
  final filters = ["All", "Closed", "Open"];

  void setFilter(String? value) {
    selectedFilter = value;
    final page = pages[selectedFilter] ?? 0;
    pageController.jumpToPage(page);
    notifyListeners();
  }

  Future<void> refreshStatus() async {
    await getServicesStatus();
  }

  Future<void> refreshAllList(BuildContext context) async {
    context.read<AllServiceRequestVM?>()?.refreshList();
    context.read<OpenServiceRequestVM?>()?.refreshList();
    context.read<CloseServiceRequestVM?>()?.refreshList();
    refreshStatus();
  }
}
