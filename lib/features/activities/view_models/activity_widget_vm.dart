import 'dart:developer';

import 'package:hive_mobile/app/extensions/date_time_extension.dart';
import 'package:hive_mobile/app/models/data/activity_model.dart';

class ActivityWidgetVM {
  final ActivityModel model;

  ActivityWidgetVM({required this.model});

  String get ownerImageUrl => model.owner?.picture?.file ?? "";

  String get ownerName => model.owner?.accountData?.extra?.employeeName ?? "";

  String? get bannerImageUrl => model.banner?.file;

  String get description => model.description ?? "";

  String get postedTime {
    var time = DateTime.tryParse(model.dateAdded ?? "") ?? DateTime.now();
    return time.formattedTime;
  }

  bool isSelected(ActivityStatus? status) {
    return status == model.getSelection;
  }
}
