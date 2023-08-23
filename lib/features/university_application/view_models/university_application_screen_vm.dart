import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/models/data/university_application/university_application_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';

import 'package:hive_mobile/features/university_application/repositories/university_application_repo.dart';

class UniversityApplicationScreenVM extends ChangeNotifier {
  bool _isAcceptedLoading = true;
  bool _isPreviousLoading = true;
  bool _isGettingMoreAccepted = false;
  bool _isGettingMorePrevious = false;
  bool _hasAllAccepted = false;
  bool _hasAllPrevious = false;
  int _acceptedAppOffset = 0;
  int _previousAppOffset = 0;
  final _limit = 10;

  bool get isGettingMoreAccepted => _isGettingMoreAccepted;

  bool get isAcceptedLoading => _isAcceptedLoading;

  bool get isPreviousLoading => _isPreviousLoading;

  bool get hasAllAccepted => _hasAllAccepted;

  bool get hasAllPrevious => _hasAllPrevious;

  late UniversityApplicationRepository universityApplicationRepository;

  ApiService apiService = GetIt.instance.get<ApiService>();

  List<UniversityApplicationModel> acceptedApplications = [];
  List<UniversityApplicationModel> previousApplications = [];

  UniversityApplicationScreenVM() {
    universityApplicationRepository =
        UniversityApplicationRepoImpl(apiService: apiService);
    getApplications();
  }

  Future<void> getApplications() async {
    await getAcceptedApplications();
    await getPreviousApplications();
  }

  Future<void> getAcceptedApplications() async {
    final request = () async {
      var list = await universityApplicationRepository.getAcceptedApplications(
          limit: _limit);
      if (list.length < _limit) {
        _hasAllAccepted = true;
      }
      log("accepted : ${list.length}");
      _acceptedAppOffset = list.length;
      acceptedApplications = list;
    };
    await performRequest(request: request);
    _isAcceptedLoading = false;
    notifyListeners();
  }

  Future<void> getNextAcceptedApplications() async {
    _isGettingMoreAccepted = true;
    final request = () async {
      var list = await universityApplicationRepository.getAcceptedApplications(
          limit: _limit, offSet: _acceptedAppOffset);
      if (list.length < _limit) {
        _hasAllAccepted = true;
      }
      _acceptedAppOffset += list.length;
      acceptedApplications = list;
    };
    await performRequest(request: request);
    _isGettingMoreAccepted = false;
    notifyListeners();
  }

  Future<void> getPreviousApplications() async {
    final request = () async {
      var list = await universityApplicationRepository.getPreviousApplications(
          limit: _limit);
      if (list.length < _limit) {
        _hasAllAccepted = true;
      }
      log("previous : ${list.length}");
      _previousAppOffset = list.length;
      previousApplications = list;
    };
    await performRequest(request: request);
    _isPreviousLoading = false;
    notifyListeners();
  }

  Future<void> getNextPreviousApplications() async {
    _isGettingMorePrevious = true;
    final request = () async {
      var list = await universityApplicationRepository.getPreviousApplications(
          limit: _limit, offSet: _previousAppOffset);
      if (list.length < _limit) {
        _hasAllPrevious = true;
      }
      _previousAppOffset += list.length;
      previousApplications = list;
    };
    await performRequest(request: request);
    _isGettingMorePrevious = false;
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
    _acceptedAppOffset = 0;
    _previousAppOffset = 0;
    await getApplications();
    return;
  }

  bool _hasError = false;

  bool get hasError => _hasError;

  void onError() {
    if (previousApplications.isEmpty && acceptedApplications.isEmpty) {
      _hasError = true;
    }
    _isAcceptedLoading = false;
    _isPreviousLoading = false;
    _isGettingMoreAccepted = false;
    _isGettingMorePrevious = false;
    notifyListeners();
  }

  bool get isGettingMorePrevious => _isGettingMorePrevious;

  String _selectedStatus = AppStrings.applied;


}
