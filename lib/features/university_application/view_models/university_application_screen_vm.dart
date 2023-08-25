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
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

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
    await setIsarInstances();
    await getLocalSaveApplication();
    await getAcceptedApplications();
    await getPreviousApplications();
  }

  Future<void> getLocalSaveApplication() async {
    try {
      var list = await getLocalApplications(acceptedAppIsar);
      acceptedApplications.addAll(list);
      acceptedApplications = acceptedApplications.toSet().toList();
      var previousList = await getLocalApplications(previousAppIsar);
      previousApplications.addAll(previousList);
      previousApplications = previousApplications.toSet().toList();
    } catch (e) {
      log("isar error : ${e.toString()}");

      // TODO
    }
  }

  Future<void> getAcceptedApplications() async {
    // var list = await getLocalApplications(acceptedAppIsar);
    // acceptedApplications.addAll(list);
    // acceptedApplications = acceptedApplications.toSet().toList();
    final request = () async {
      var list = await universityApplicationRepository.getAcceptedApplications(
          limit: _limit);
      if (list.length < _limit) {
        _hasAllAccepted = true;
      }
      log("accepted : ${list.length}");
      _acceptedAppOffset = list.length;
      acceptedApplications.addAll(list);
      acceptedApplications = acceptedApplications.toSet().toList();
      await setLocalApplications(acceptedAppIsar, list);
    };
    await performRequest(request: request);
    _isAcceptedLoading = false;
    notifyListeners();
  }

  Future<void> getNextAcceptedApplications() async {
    _isGettingMoreAccepted = true;
    notifyListeners();
    final request = () async {
      var list = await universityApplicationRepository.getAcceptedApplications(
          limit: _limit, offSet: _acceptedAppOffset);
      if (list.length < _limit) {
        _hasAllAccepted = true;
      }
      _acceptedAppOffset += list.length;
      acceptedApplications.addAll(list);
      acceptedApplications = acceptedApplications.toSet().toList();
    };
    await performRequest(request: request);
    _isGettingMoreAccepted = false;
    notifyListeners();
  }

  Future<void> getPreviousApplications() async {
    // var list = await getLocalApplications(previousAppIsar);
    // previousApplications.addAll(list);
    final request = () async {
      log("pre previous");
      var list = await universityApplicationRepository.getPreviousApplications(
          limit: _limit);
      if (list.length < _limit) {
        _hasAllPrevious = true;
      }
      log("previous : ${list.length}");
      _previousAppOffset = list.length;
      previousApplications.addAll(list);
      previousApplications = previousApplications.toSet().toList();
      await setLocalApplications(previousAppIsar, list);
    };
    await performRequest(request: request);
    _isPreviousLoading = false;
    notifyListeners();
  }

  Future<void> getNextPreviousApplications() async {
    _isGettingMorePrevious = true;
    notifyListeners();
    final request = () async {
      var list = await universityApplicationRepository.getPreviousApplications(
          limit: _limit, offSet: _previousAppOffset);
      if (list.length < _limit) {
        _hasAllPrevious = true;
      }
      _previousAppOffset += list.length;
      previousApplications.addAll(list);
      previousApplications = previousApplications.toSet().toList();
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

  Isar? acceptedAppIsar;
  Isar? previousAppIsar;
  bool isIsar = false;

  Future<void> setIsarInstances() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      acceptedAppIsar = await Isar.open([UniversityApplicationModelSchema],
          directory: dir.path, name: "accepted_application");
      previousAppIsar = await Isar.open([UniversityApplicationModelSchema],
          directory: dir.path, name: "previous_application");
      isIsar = true;
    } catch (e) {
      log("error setting isar error: ${e.toString()}");
    }
  }

  Future<List<UniversityApplicationModel>> getLocalApplications(
      Isar? isar) async {
    if (!isIsar) {
      return [];
    }
    try {
      var collection = await isar!.collection<UniversityApplicationModel>();
      var list = await collection.where().findAll();
      log("local list ${list.length}");
      return list;
    } catch (e) {
      log("isar error : ${e.toString()}");
      // TODO
    }
    return [];
  }

  Future<void> setLocalApplications(
      Isar? isar, List<UniversityApplicationModel> list) async {
    if (!isIsar) {
      return;
    }
    // final _limit = 10;
    // if (list.length > _limit) {
    //   list = List<UniversityApplicationModel>.generate(
    //       _limit, (index) => list[index]);
    // }
    try {
      var collection = await isar!.collection<UniversityApplicationModel>();
      await isar.writeTxn(
        () => collection.where().deleteAll(),
      );
      await isar.writeTxn(
        () => collection.putAll(list),
      );
    } catch (e) {
      log("isar saving error : ${e.toString()}");
      // TODO
    }
  }

  @override
  void dispose() {
    acceptedAppIsar?.close();
    previousAppIsar?.close();
    super.dispose();
  }
}
