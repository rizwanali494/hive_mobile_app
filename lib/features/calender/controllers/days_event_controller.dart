import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/activity_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/view_models/base_api_vm.dart';
import 'package:hive_mobile/features/calender/repositories/days_event_repo.dart';

class DaysEventController extends BaseApiVM<ActivityModel> {
  late DaysEventRepo repo;
  final apiService = GetIt.instance.get<ApiService>();

  DaysEventController({required this.time});

  DateTime time;

  DateTime get endDate => time.add(Duration(days: 1));

  DateTime get startDate => time
      .copyWith(
        hour: 23,
        minute: 59,
        second: 59,
      )
      .subtract(Duration(days: 1));

  @override
  Future<List<ActivityModel>> fetchInitialItems() async {
    var list = await repo.getAllEvents(
        startDate: startDate, endDate: endDate, limit: limit);
    return list;
  }

  @override
  Future<List<ActivityModel>> fetchNextItems() async {
    var list = await repo.getAllEvents(
        startDate: startDate, endDate: endDate, offset: offSet, limit: limit);
    return list;
  }

  @override
  void setRepoInstance() {
    repo = DaysEventRepo(service: apiService);
  }

  @override
  Future<List<ActivityModel>> fetchLocalList() async {
    return const [];
  }

  @override
  Future<void> saveToLocal(List<ActivityModel> items) async {
    return;
  }
}
