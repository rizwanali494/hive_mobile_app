import 'package:timeago/timeago.dart' as timeago;

extension DateTimeExtension on DateTime {
  String get formattedTime {
    return timeago.format(
      this,
    );
  }
}
