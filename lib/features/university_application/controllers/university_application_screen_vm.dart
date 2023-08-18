import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/models/data/university_application_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';

import 'package:hive_mobile/features/university_application/repositories/university_application_repo.dart';

class UniversityApplicationScreenVM extends ChangeNotifier {
  bool _isAcceptedLoading = false;
  bool _isPreviousLoading = false;
  bool _hasAllAccepted = false;
  bool _hasAllPrevious = false;
  int _acceptedAppOffset = 0;
  int _previousAppOffset = 0;
  final _limit = 10;

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
  }

  Future<void> getAcceptedApplications() async {
    final request = () async {
      var list =
          await universityApplicationRepository.getAcceptedApplications();
      if (list.length < _limit) {
        _hasAllAccepted = true;
      }
      _acceptedAppOffset = list.length;
      acceptedApplications = list;
    };
    await performRequest(request: request);
    notifyListeners();
  }

  Future<void> getNextAcceptedApplications() async {
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
    notifyListeners();
  }

  Future<void> getPreviousApplications() async {
    final request = () async {
      var list =
          await universityApplicationRepository.getAcceptedApplications();
      if (list.length < _limit) {
        _hasAllAccepted = true;
      }
      _previousAppOffset = list.length;
      previousApplications = list;
    };
    await performRequest(request: request);
    notifyListeners();
  }

  Future<void> getNextPreviousApplications() async {
    final request = () async {
      var list = await universityApplicationRepository.getAcceptedApplications(
          limit: _limit, offSet: _previousAppOffset);
      if (list.length < _limit) {
        _hasAllAccepted = true;
      }
      _previousAppOffset += list.length;
      previousApplications = list;
    };
    await performRequest(request: request);
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
    }
  }
}
