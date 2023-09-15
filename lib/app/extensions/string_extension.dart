import 'package:timeago/timeago.dart' as timeago;

extension StringExtension on String {
  Uri get parsedUri {
    return Uri.parse(this);
  }

  String get timeAdded {
    return timeago.format(
      DateTime.tryParse(this) ?? DateTime.now(),
    );
  }
}
