import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/navigation/extensions.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/features/my_services/repositories/new_service_request_repo.dart';
import 'package:hive_mobile/features/my_services/screens/my_services_screen.dart';

class ServiceRequestVM extends ChangeNotifier with UtilFunctions {
  bool _isChangeRequest = false;
  late NewServiceRequestRepo newServiceRequestRepo;

  ServiceRequestVM() {
    newServiceRequestRepo = NewServiceRequestRepo(apiService: apiService);
  }

  bool get isChangeRequest => _isChangeRequest;

  void toggleChangeRequest() {
    _isChangeRequest = !_isChangeRequest;
    notifyListeners();
  }

  void validate(String title, String description, BuildContext context) {
    if (title
        .trim()
        .isEmpty || description
        .trim()
        .isEmpty) {
      return;
    }
    sendNewRequest(title, description, context);
  }

  final apiService = GetIt.instance.get<ApiService>();

  Future<void> sendNewRequest(String title, String description,
      BuildContext context) async {
    var body = {
      "name": title,
      "description": description,
      "is_subject_teacher_change_request": _isChangeRequest
    };
    showLoaderDialog(context);
    try {
      await newServiceRequestRepo.requestNewService(body: body);
      context.popUntil(MyServicesScreen.route);
      return;
    } catch (e) {}
    context.pop();
  }
}
