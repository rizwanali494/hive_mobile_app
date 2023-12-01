import 'dart:developer';
import 'dart:io';
import 'package:form_validator/form_validator.dart';
import 'package:hive_mobile/app/extensions/form_validator_extension.dart';
import 'package:hive_mobile/app/view_models/document_widget_controller.dart';
import 'package:hive_mobile/features/university_application/view_models/request_vm.dart';
import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/attachments_model.dart';
import 'package:hive_mobile/app/models/data/university_application/university_application_model.dart';
import 'package:hive_mobile/app/models/data/university_application/university_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/features/university_application/repositories/university_application_repo.dart';
import 'package:path_provider/path_provider.dart';

class UniversityAppRequestIdVM extends UniAppRequestVM {
  List<UniversityModel> universities = [];
  late UniversityApplicationRepository repository;
  ApiService apiService = GetIt.instance.get<ApiService>();
  UniversityApplicationModel? model;
  bool hasDocumentChanged = false;
  final scholarShipAmount = TextEditingController();
  final scholarShipPercent = TextEditingController();

  // final description = TextEditingController()

  final objectId;

  UniversityAppRequestIdVM({required this.objectId}) {
  }

  bool isObjectLoading = true;

  @override
  void initValues() {
    repository = UniversityApplicationRepoImpl(apiService: apiService);
    isGettingUniversities = false;
    getData();
  }

  @override
  Future<void> refresh() async {
    hasError = false;
    isObjectLoading = true;
    notifyListeners();
    getData();
  }

  Future<void> getData() async {
    isObjectLoading = true;
    notifyListeners();
    final object = await repository.getUniversityApplication(id: objectId);
    log("hitting get data");
    model = object;
    isObjectLoading = false;
    setModelValues();
  }
}
