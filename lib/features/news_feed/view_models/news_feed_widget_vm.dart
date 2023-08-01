import 'package:hive_mobile/app/extensions/date_time_extension.dart';
import 'package:hive_mobile/app/models/data/announcement_post_model.dart';

class NewsFeedWidgetVm {
  final AnnouncementPostModel _model;

  NewsFeedWidgetVm({required AnnouncementPostModel model}) : _model = model;

  String get userName {
    return _model.owner?.accountData?.extra?.employeeName ?? "";
  }

  String get description {
    return _model.text ?? "";
  }

  String? get userImage {
    return _model.owner?.picture?.file;
  }

  bool get isPost {
    return _model.type == "POST";
  }

  String get attachment {
    var list = _model.attachments;
    if (list?.isNotEmpty ?? false) {
      return list?.first.file ?? "";
    }
    return "";
  }

  String get likes {
    return (_model.likes?.toInt() ?? 0).toString();
  }

  String get dislikes {
    return (_model.dislikes?.toInt() ?? 0).toString();
  }

  String get postTime {
    var time = DateTime.tryParse(_model.dateAdded ?? "");
    return time?.formattedTime ?? "";
  }
}
