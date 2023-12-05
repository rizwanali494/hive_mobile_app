import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/extensions/api_query_params_extension.dart';
import 'package:hive_mobile/app/models/data/my_services_model.dart';

import 'package:hive_mobile/features/my_services/view_models/base_service_request_vm.dart';
import 'package:isar/isar.dart';

class CloseServiceRequestVM extends BaseServiceWidgetVM {
  CloseServiceRequestVM()
      : super(apiUrl: ApiEndpoints.serviceRequest.withNotPendingState);

  @override
  Future<List<MyServicesModel>> fetchLocalList() async {
    var list = await localService
        .query()
        .filter()
        .not()
        .stateEqualTo("PENDING")
        .findAll();
    return getSortedList(list);
  }

  @override
  Future<void> saveToLocal(List<MyServicesModel> items) async {
    await localService
        .query()
        .filter()
        .not()
        .stateEqualTo("PENDING")
        .deleteAll()
        .then((value) => localService.saveAll(items));
  }
}
