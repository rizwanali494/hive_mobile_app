import 'package:flutter/cupertino.dart';
import 'package:hive_mobile/app/extensions/date_time_extension.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/announcement_post_model.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/polls_model.dart';

class NewsFeedWidgetVm  {
  final AnnouncementPostModel model;

  NewsFeedWidgetVm({required AnnouncementPostModel model}) : model = model;

  String get userName {
    return model.owner?.accountData?.extra?.employeeName ?? "";
  }

  String get description {
    return model.text ?? "";
  }

  String? get userImage {
    return model.owner?.picture?.file;
  }

  bool get isPost {
    return model.type == "POST";
  }

  final ValueNotifier<int> currentImageIndex = ValueNotifier<int>(0);

  void setCurrentImageIndex(int index) {
    currentImageIndex.value = index;
  }

  List<String?>? get attachments {
    return model.attachments?.map((e) => e.file).toList();
  }

  String get likes {
    return (model.likes?.toInt() ?? 0).toString();
  }

  String get dislikes {
    return (model.dislikes?.toInt() ?? 0).toString();
  }

  String get postTime {
    var time = DateTime.tryParse(model.dateAdded ?? "");
    return time?.formattedTime ?? "";
  }

  List<Polls> get polls {
    return (model.polls ?? []);
  }

  double? get totalSelectors {
    return model.polls?.fold(
        0.0,
        (previousValue, element) =>
            (previousValue ?? 0) + (element.selectors ?? 0));
  }

  bool get isLiked {
    return model.isLiked ?? false;
  }

  bool get isDisliked {
    return model.isDisliked ?? false;
  }
}
