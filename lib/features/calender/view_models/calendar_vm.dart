import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarVM extends ChangeNotifier {
  static const _startYear = 2023;
  int? selectedValue;

  List<String> monthNames = DateFormat.MMMM().dateSymbols.MONTHS;
  List<int> years = [...List.generate(5, (index) => (_startYear + index))];
  List<String> shortWeekDays = DateFormat.MMMM().dateSymbols.SHORTWEEKDAYS;

  void setYear(int? val) {
    selectedValue = val;
    notifyListeners();
  }
}
