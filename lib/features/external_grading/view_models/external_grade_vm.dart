import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/extensions/list_extension.dart';
import 'package:hive_mobile/app/models/data/external_grade_model.dart';
import 'package:hive_mobile/app/models/pagination_controller.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/services/local_services/local_service.dart';
import 'package:hive_mobile/app/view_models/base_api_vm.dart';
import 'package:hive_mobile/features/external_grading/external_grade_repository.dart';

class ExternalGradeVM extends BaseApiVM<ExternalGradeModel> {
  late ExternalGradesRepo externalGradeRepo;

  @override
  Future<List<ExternalGradeModel>> fetchInitialItems() async {
    return await externalGradeRepo.getInitialGradesList(limit: limit);
  }

  @override
  Future<List<ExternalGradeModel>> fetchNextItems() async {
    return await externalGradeRepo.getNextGradesList(
        limit: limit, offSet: offSet);
  }

  final apiService = GetIt.instance.get<ApiService>();

  @override
  void setRepoInstance() {
    externalGradeRepo = ExternalGradeRepositoryImpl(apiService: apiService);
  }

  bool get isLoading => uiState.isLoading;

  bool get hasError => uiState.hasError;
}
