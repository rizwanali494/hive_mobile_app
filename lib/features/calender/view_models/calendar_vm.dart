import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarVM extends ChangeNotifier {
  bool isValidDay(int day, int month, int year) {
    DateTime now = DateTime.now();
    final days = DateTime(year, month + 1, 0).day;
    var daysInMonth = List<int>.generate(days, (index) => index + 1);
    debugPrint(daysInMonth.toString());
    debugPrint(day.toString());
    debugPrint(daysInMonth.contains(day).toString());
    return daysInMonth.contains(day);
  }

  List<String> monthNames = DateFormat.MMMM().dateSymbols.MONTHS;
  List<String> shortWeekDays = DateFormat.MMMM().dateSymbols.SHORTWEEKDAYS;
}
