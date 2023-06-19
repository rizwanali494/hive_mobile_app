import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarVM extends ChangeNotifier {

  List<String> monthNames = DateFormat.MMMM().dateSymbols.MONTHS;
  List<String> shortWeekDays = DateFormat.MMMM().dateSymbols.SHORTWEEKDAYS;
}
