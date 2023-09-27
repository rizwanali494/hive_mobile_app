import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/constants/file_upload_purpose.dart';
import 'package:hive_mobile/app/extensions/api_query_params_extension.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/attachments_model.dart';
import 'package:hive_mobile/app/models/data/awards_model.dart';
import 'package:hive_mobile/app/models/data/hobbies_model.dart';
import 'package:hive_mobile/app/models/data/university_application/university_application_model.dart';
import 'package:hive_mobile/app/models/data/user_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';

abstract class UserProfileRepo {
  late ApiService apiService;

  UserProfileRepo({required this.apiService});

  Future<List<UniversityApplicationModel>> getAcceptedApplications(
      {int? limit, int? offSet});

  Future<List<AwardsModel>> getAwards({int? limit, int? offSet});

  Future<List<HobbiesModel>> updateHobbies({required Object map});

  Future<Attachments> uploadProfilePicture({required File file});

  Future<void> updateBio({required Map map, required int id});

  Future<UserModel> updateUserProfile({required Map map});
}

class UserProfileRepoImpl extends UserProfileRepo {
  UserProfileRepoImpl({required super.apiService});

  String apiEndpoint(int? offSet, int? limit) =>
      ApiEndpoints.universityApplication.withDocuments.withUniversity
          .withOffSet(offSet)
          .withLimit(limit)
          .withMostRecentOrder;

  @override
  Future<List<UniversityApplicationModel>> getAcceptedApplications(
      {int? limit, int? offSet}) async {
    var url = apiEndpoint(offSet, limit).withApprovedStatus;
    log(url);
    var response = await apiService.get(url: url);
    var body = jsonDecode(response.body);
    List result = body["results"] ?? [];
    return result
        .map((item) => UniversityApplicationModel.fromJson(item))
        .toList();
  }

  @override
  Future<List<AwardsModel>> getAwards({int? limit, int? offSet}) async {
    var url =
        ApiEndpoints.award.withLimit(limit).withOffSet(offSet).withAchievement;
    log(url);
    var response = await apiService.get(url: url);
    var body = jsonDecode(response.body);
    List result = body["results"] ?? [];
    return result.map((item) => AwardsModel.fromJson(item)).toList();
  }

  @override
  Future<List<HobbiesModel>> updateHobbies({required Object map}) async {
    var url = ApiEndpoints.hobby;
    log("$url hobbies : $map ${map.runtimeType}");
    var response = await apiService.post(url: url, body: map);
    var body = jsonDecode(response.body);
    log("response body : $body");
    log("response body : ${response.statusCode}");
    List result = body ?? [];
    return result.map((item) => HobbiesModel.fromJson(item)).toList();
  }

  @override
  Future<Attachments> uploadProfilePicture({required File file}) async {
    var response = await apiService.uploadSingleFile(
      file: file,
      purpose: FileUploadPurpose.PROFILE_PICTURE,
    );
    var body = jsonDecode(response.body);
    return Attachments.fromJson(body);
  }

  @override
  Future<void> updateBio({required Map map, required int id}) async {
    var url = ApiEndpoints.studentUser.withId(id);
    log("$url Bio");
    await apiService.patch(url: url, body: map);
    return;
  }

  @override
  Future<UserModel> updateUserProfile({required Map map}) async {
    var url = ApiEndpoints.me;
    var response = await apiService.patch(url: url, body: map);
    var body = jsonDecode(response.body);
    return UserModel.fromJson(body);
  }
}
