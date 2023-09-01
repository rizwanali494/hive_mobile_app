import 'package:flutter/material.dart';
import 'package:hive_mobile/features/calender/controllers/clean_calendar_controller.dart';
import 'package:intl/intl.dart';

class CalendarVM extends ChangeNotifier {
  static const _startYear = 2023;
  int? selectedValue;
  final controller = CleanCalendarController(
      minDate: DateTime(2024), maxDate: DateTime(2024, 12), readOnly: true);

  List<String> monthNames = DateFormat.MMMM().dateSymbols.MONTHS;
  List<int> years = [...List.generate(5, (index) => (_startYear + index))];
  List<String> shortWeekDays = DateFormat.MMMM().dateSymbols.SHORTWEEKDAYS;

  void setYear(int? val) {
    selectedValue = val;
    controller.setDate(val ?? 0);
    notifyListeners();
  }
}
