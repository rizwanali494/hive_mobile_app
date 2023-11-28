import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/extensions/list_extension.dart';
import 'package:hive_mobile/app/models/data/my_services_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/view_models/base_api_vm.dart';
import 'package:hive_mobile/features/my_services/repositories/my_services_repository.dart';
import 'package:hive_mobile/features/my_services/view_models/service_request_widget_vm.dart';

abstract class BaseServiceWidgetVM extends BaseApiVM<MyServicesModel> {
  final String apiUrl;
  final apiService = GetIt.instance.get<ApiService>();
  late MyServicesRepository myServicesRepository;

  BaseServiceWidgetVM({required this.apiUrl});

  @override
  Future<List<MyServicesModel>> fetchInitialItems() async {
    final list = await myServicesRepository.getInitialServicesList(
        limit: limit, apiUrl: apiUrl);
    return list;
  }

  @override
  Future<List<MyServicesModel>> fetchNextItems() async {
    final list = await myServicesRepository.getInitialServicesList(
        limit: limit, offSet: offSet, apiUrl: apiUrl);
    return list;
  }

  @override
  void setRepoInstance() {
    myServicesRepository = MyServicesRepositoryImpl(apiService: apiService);
  }

  ServiceRequestWidgetVM get widgetVM {
    return ServiceRequestWidgetVM(
        refreshList: refreshList,
        listCount: listCount,
        items: items,
        scrollController: scrollController,
        uiState: uiState);
  }

  List<MyServicesModel> getSortedList(List<MyServicesModel> list) {
    list.sortByRecentOrder(
      getDateAdded: (item) =>
          DateTime.tryParse(item.dateAdded ?? "") ?? DateTime.now(),
    );
    return list;
  }

  @override
  void sortByRecentOrder() {
    items.sortByRecentOrder(
      getDateAdded: (item) =>
          DateTime.tryParse(item.dateAdded ?? "") ?? DateTime.now(),
    );
  }
}
