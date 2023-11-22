import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

extension StringExtension on String {
  Uri get parsedUri {
    return Uri.parse(this);
  }

  String get timeAgoAdded {
    return timeago.format(
      DateTime.tryParse(this) ?? DateTime.now(),
    );
  }
  String get timeAgo  {
    var time = DateTime.tryParse(this) ?? DateTime.now();
    return _timeOnlyFormat.format(time.toLocal());
  }

  DateTime get toDatetime {
    return DateTime.tryParse(this) ?? DateTime.now();
  }
}
var _timeOnlyFormat = DateFormat('h:mm a');
