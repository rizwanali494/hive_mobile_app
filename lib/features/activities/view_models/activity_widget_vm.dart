
import 'package:hive_mobile/app/extensions/date_time_extension.dart';
import 'package:hive_mobile/app/models/data/activity_model.dart';

class ActivityWidgetVM {
  final ActivityModel model;

  ActivityWidgetVM({required this.model});

  String get ownerImageUrl => model.owner?.picture?.file ?? "";

  String get ownerName => model.owner?.accountData?.extra?.employeeName ?? "";

  String? get bannerImageUrl => model.banner?.file;

  String get description => model.description ?? "";

  String get campusName => model.location ?? "";

  String get eventBy => model.owner?.accountData?.extra?.employeeName ?? "";

  String get peopleGoing => (model.attendingStudents ?? 0).toString();

  String get postedTime {
    var time = DateTime.tryParse(model.dateAdded ?? "") ?? DateTime.now();
    return time.formattedTime;
  }

  String get name => model.name ?? "";

  String get eventDay {
    var eventDay = DateTime.tryParse(model.date ?? "") ?? DateTime.now();
    return eventDay.dayOnly;
  }

  String get eventTime {
    var eventDay = DateTime.tryParse(model.date ?? "") ?? DateTime.now();
    return eventDay.timeOnly;
  }

  String get dateOnly {
    var eventDay = DateTime.tryParse(model.date ?? "") ?? DateTime.now();
    return eventDay.dateOnly;
  }

  String get monthOnly {
    var eventDay = DateTime.tryParse(model.date ?? "") ?? DateTime.now();
    return eventDay.monthOnly;
  }

  bool isSelected(ActivityStatus? status) {
    return status == model.getSelection;
  }
}
