import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/view_models/base_sliver_list_vm.dart';
import 'package:hive_mobile/features/profile/repositories/user_profile_repo.dart';

class UserAwardsVM extends BaseSliverListVM<String> {
  final apiService = GetIt.instance.get<ApiService>();
  late UserProfileRepo userProfileRepo;

  @override
  Future<List<String>> getInitialElements() async {
    var items = await userProfileRepo.getAwards(limit: limit);
    var list = items.map((e) => e.achievement?.name ?? "").toList();
    return list;
  }

  @override
  Future<List<String>> getNextElements() async {
    var items = await userProfileRepo.getAwards(limit: limit, offSet: offset);
    var list = items.map((e) => e.achievement?.name ?? "").toList();
    return list;
  }

  @override
  void setRepoInstance() {
    userProfileRepo = UserProfileRepoImpl(apiService: apiService);
  }
}
