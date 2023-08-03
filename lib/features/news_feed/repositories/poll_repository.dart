import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/extensions/api_fields_expands_extension.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';

class PollRepository {
  GetIt getIt = GetIt.instance;
  late ApiService apiService;

  PollRepository() {
    apiService = getIt.get<ApiService>();
  }

  Future<bool> selectPoll(int id) async {
    var url = ApiEndpoints.announcementPost.selectPoll(id);
    await apiService.post(url: url, body: {});
    return true;
  }
}
