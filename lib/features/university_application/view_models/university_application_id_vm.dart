import 'dart:developer';
import 'package:hive_mobile/features/university_application/view_models/request_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/university_application/university_application_model.dart';
import 'package:hive_mobile/app/models/data/university_application/university_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/features/university_application/repositories/university_application_repo.dart';

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

  UniversityAppRequestIdVM({required this.objectId}) {}

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
    try {
      final object = await repository.getUniversityApplication(id: objectId);
      log("hitting get data");
      model = object;
      setModelValues();
    } catch (e) {
      log("error : ${e.toString()}");
      hasError = true;
    }
    isObjectLoading = false;
    notifyListeners();
  }
}
