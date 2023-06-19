import 'package:flutter/cupertino.dart';

class WeekDayVM extends ChangeNotifier {
  final int month;
  final int year;

  WeekDayVM({required this.month, required this.year});

  bool isValidDay(int day) {
    final days = DateTime(year, month + 1, 0).day;
    var daysInMonth = List<int>.generate(days, (index) => index + 1);
    debugPrint(daysInMonth.toString());
    debugPrint(day.toString());
    debugPrint(daysInMonth.contains(day).toString());
    return daysInMonth.contains(day);
  }
}
