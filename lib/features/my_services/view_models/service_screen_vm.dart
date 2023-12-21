import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/my_services_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/services/local_services/isar_service.dart';
import 'package:hive_mobile/app/services/web_socket_services/api_event_handler.dart';
import 'package:hive_mobile/app/services/web_socket_services/web_socket_service.dart';
import 'package:hive_mobile/features/my_services/repositories/my_services_repository.dart';
import 'package:hive_mobile/features/my_services/view_models/all_service_request_vm.dart';
import 'package:hive_mobile/features/my_services/view_models/close_service_request_vm.dart';
import 'package:hive_mobile/features/my_services/view_models/open_service_request_vm.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

import 'package:hive_mobile/app/exceptions/base_exception_controller.dart';

class ServiceScreenVM extends ChangeNotifier with BaseExceptionController {
  void notifyListener() {
    notifyListeners();
  }

  ServiceScreenVM() {
    getServicesStatus();
    setEventHandler();
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
      handleException(e);
    }
  }

  void setEventHandler() {
    apiEventHandler = APIEventHandler(
      handleEvent: handleApiEvent,
      apiEventTypes: ["SERVICE_REQUEST"],
    );
  }

  final localService = IsarService<MyServicesModel>();

  Future<void> setServiceStatusLocally() async {
    totalApproved = await localService
        .query()
        .filter()
        .not()
        .stateEqualTo("PENDING")
        .count();
    totalPending =
        await localService.query().filter().stateEqualTo("PENDING").count();
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

  APIEventHandler? apiEventHandler;

  void handleApiEvent(dynamic data) {
    log("Service handler count is ::::::::::::::::: ${data}");
    final eventData = jsonDecode(data);
    String? action = eventData["action"];
    final extraData = eventData["extra"] ?? {};
    eventActions[action]?..call(extraData);
  }

  late Map<String, Function(dynamic data)> eventActions = {
    "UPDATE": updateService,
  };

  void updateService(dynamic data) {
    refreshStatus();
  }

  Future<void> refreshAllList(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    context.read<AllServiceRequestVM?>()?.refreshList();
    context.read<OpenServiceRequestVM?>()?.refreshList();
    context.read<CloseServiceRequestVM?>()?.refreshList();
    refreshStatus();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    apiEventHandler?.dispose();
    super.dispose();
  }
}

