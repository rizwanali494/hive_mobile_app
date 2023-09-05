import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/features/profile/repositories/user_profile_repo.dart';
import 'package:hive_mobile/features/profile/view_models/base_profile_info_vm.dart';

class UserAwardsVM extends BaseProfileInfoVM {
  final apiService = GetIt.instance.get<ApiService>();
  late UserProfileRepo userProfileRepo;

  @override
  Future<List<String>> getInitialElements() async {
    var items = await userProfileRepo.getAwards(limit: limit);
    var list = items.map((e) => e.awardName ?? "").toList();
    return list;
  }

  @override
  Future<List<String>> getNextElements() async {
    var items = await userProfileRepo.getAwards(limit: limit, offSet: offset);
    var list = items.map((e) => e.awardName ?? "").toList();
    return list;
  }

  @override
  void setRepoInstance() {
    userProfileRepo = UserProfileRepoImpl(apiService: apiService);
  }
}
