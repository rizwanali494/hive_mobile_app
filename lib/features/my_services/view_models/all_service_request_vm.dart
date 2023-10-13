import 'package:hive_mobile/app/constants/api_endpoints.dart';

import 'package:hive_mobile/features/my_services/view_models/base_service_request_vm.dart';

class AllServiceRequestVM extends ServiceScreenVM {
  AllServiceRequestVM() : super(apiUrl: ApiEndpoints.serviceRequest);
}
