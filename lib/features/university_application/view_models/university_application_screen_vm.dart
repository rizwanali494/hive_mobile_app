import 'dart:developer';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/models/data/university_application/university_application_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/services/local_services/isar_service.dart';

import 'package:hive_mobile/features/university_application/repositories/university_application_repo.dart';
import 'package:hive_mobile/features/university_application/view_models/uni_app_sliver_vm.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

abstract class BaseUniversityApplicationScreenVM extends ChangeNotifier {
  bool _isAcceptedLoading = true;
  bool _isGettingMoreAccepted = false;
  bool _hasAll = false;
  int offset = 0;
  final _limit = 10;

  bool get isGettingMoreAccepted => _isGettingMoreAccepted;

  bool get isAcceptedLoading => _isAcceptedLoading;

  bool get hasAllAccepted => _hasAll;

  late UniversityApplicationRepository universityApplicationRepository;

  ApiService apiService = GetIt.instance.get<ApiService>();

  List<UniversityApplicationModel> applications = [];

  BaseUniversityApplicationScreenVM() {
    universityApplicationRepository =
        UniversityApplicationRepoImpl(apiService: apiService);
    getApplications();
  }

  Future<void> getApplications() async {
    await getAcceptedApplications();
  }

  Future<List<UniversityApplicationModel>> fetchInitialItems(
      {required int limit});

  Future<List<UniversityApplicationModel>> fetchNextItems(
      {required int limit, required int offset});

  Future<List<UniversityApplicationModel>> fetchLocalList();

  Future<void> getAcceptedApplications() async {
    final request = () async {
      var list = await fetchInitialItems(limit: _limit);
      if (list.length < _limit) {
        _hasAll = true;
      }
      offset = list.length;
      applications.addAll(list);
      applications = applications.toSet().toList();
      setLocalApplications();
    };
    await performRequest(request: request);
    var localList = await fetchLocalList();
    applications.addAll(localList);
    applications = applications.toSet().toList();
    _isAcceptedLoading = false;
    log("loading");
    notifyListeners();
  }

  Future<void> getNextAcceptedApplications() async {
    _isGettingMoreAccepted = true;
    notifyListeners();
    final request = () async {
      var list = await fetchNextItems(limit: _limit, offset: offset);
      if (list.length < _limit) {
        _hasAll = true;
      }
      offset += list.length;
      applications.addAll(list);
      applications = applications.toSet().toList();
    };
    await performRequest(request: request);
    _isGettingMoreAccepted = false;
    notifyListeners();
  }

  Future<void> performRequest({required Function request}) async {
    try {
      await request();
    } catch (e) {
      if (e is HTTPStatusCodeException) {
        log("Error occurred : ${e.response.body}");
        log("Error occurred : ${e.response.statusCode}");
      }
      log("Error occurred : $e");
      onError();
    }
  }

  Future<void> refresh() async {
    offset = 0;
    await getAcceptedApplications();
    return;
  }

  bool _hasError = false;

  bool get hasError => _hasError;

  void onError() {
    if (applications.isEmpty) {
      _hasError = true;
    }
    _isAcceptedLoading = false;
    _isGettingMoreAccepted = false;
    notifyListeners();
  }

  final isarService = IsarService<UniversityApplicationModel>();

  Future<void> setLocalApplications() async {
    try {
      isarService
          .clearCollection()
          .then((value) => isarService.saveAll(applications));
    } catch (e) {
      // TODO
    }
  }

  void addUniversityApp(model) {
    applications.insert(0, model);
    notifyListeners();
  }

  void updateUniversityModel(model) {
    log("updated model : ${model}");
    int index = applications.indexOf(model);
    if (index > -1) {
      applications[index] = model;
    }
    notifyListeners();
    updateLocalInstance(model);
  }

  Future<void> updateLocalInstance(UniversityApplicationModel model) async {
    try {
      isarService.put(model);
    } catch (e) {}
  }

  UniAppSliverVM get sliverVM {
    return UniAppSliverVM(
      isLoading: isAcceptedLoading,
      onTap: () {
        getNextAcceptedApplications();
      },
      applications: applications,
      hasAll: _hasAll,
      isGettingMore: isGettingMoreAccepted,
      title: applicationType(),
      onUpdate: (UniversityApplicationModel model) {
        updateUniversityModel(model);
      },
    );
  }

  String applicationType();
}
