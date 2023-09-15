import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

extension DateTimeExtension on DateTime {
  String get formattedTime {
    return timeago.format(
      this,
    );
  }

  String formattedDate({bool numericDates = false}) {
    final date2 = DateTime.now();
    final difference = date2.difference(this);
    final DateFormat dateFormat = DateFormat("M/d/y");
    if (difference.inDays >= 2) {
      return dateFormat.format(this);
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }

  String get dayOnly {
    return _dayOnlyFormat.format(this);
  }

  String get timeOnly {
    return _timeOnlyFormat.format(this);
  }

  String get dateOnly {
    return _dateOnlyFormat.format(this);
  }

  String get monthOnlyShort {
    return _monthShortOnlyFormat.format(this);
  }

  String get monthOnly {
    return _monthOnlyFormat.format(this);
  }

  String get yearMonthDay {
    return _yearMonthDateFormat.format(this);
  }
}

var _dayOnlyFormat = DateFormat.EEEE();
var _yearMonthDateFormat = DateFormat("yyyy-MM-dd");
var _timeOnlyFormat = DateFormat('h:mm a');
var _dateOnlyFormat = DateFormat('d');
var _monthShortOnlyFormat = DateFormat('MMM');
var _monthOnlyFormat = DateFormat('MMMM');
