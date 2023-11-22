import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/exceptions/base_exception_controller.dart';
import 'package:hive_mobile/app/models/data/activity_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/services/local_services/isar_service.dart';
import 'package:hive_mobile/features/calender/controllers/clean_calendar_controller.dart';
import 'package:hive_mobile/features/calender/repositories/calendar_repo.dart';
import 'package:intl/intl.dart';

class CalendarVM extends ChangeNotifier with BaseExceptionController {
  static const _startYear = 2023;
  int selectedValue = _startYear;
  static const _totalYears = 5;
  final calendarController = CleanCalendarController(
      minDate: DateTime(_startYear),
      maxDate: DateTime(_startYear, 12),
      readOnly: true);

  List<String> monthNames = DateFormat.MMMM().dateSymbols.MONTHS;
  List<int> years = [
    ...List.generate(
      _totalYears,
      (index) => (_startYear + index),
    ),
  ];
  List<String> shortWeekDays = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun"
  ];

  void setYear(int? val) {
    selectedValue = val ?? 0;
    calendarController.setDate(val ?? 0);
    notifyListeners();
    getAllEvents();
  }

  final apiService = GetIt.instance.get<ApiService>();

  bool isLoading = true;
  bool hasError = false;

  CalendarVM() {
    calendarRepo = CalendarRepoImpl(apiService: apiService);
    getAllEvents();
  }

  List<ActivityModel> activities = [];
  IsarService<ActivityModel> localService = IsarService();
  late CalendarRepo calendarRepo;

  Future<void> getAllEvents() async {
    isLoading = true;
    notifyListeners();
    activities = [];
    final request = () async {
      var list = await calendarRepo.getAllEvents(
        startDate: DateTime(selectedValue),
        endDate: DateTime(selectedValue, 12, 31),
      );
      activities.addAll(list);
    };
    await performRequest(
      request: request,
      onError: (error) {
        handleException(error);
      },
    );
    isLoading = false;
    notifyListeners();
  }

  Future<void> performRequest(
      {required Function request, Function(dynamic error)? onError}) async {
    try {
      await request();
    } catch (error) {
      hasError = true;
      onError?.call(error);
      log("Error occurred : $error");
    }
    notifyListeners();
  }

  ActivityModel? getEvent(DateTime dt) {
    var list = activities.where((element) {
      var activityDate =
          DateTime.tryParse(element.date ?? "") ?? DateTime.now();
      var formattedDate =
          DateTime(activityDate.year, activityDate.month, activityDate.day);
      // log("left date = ${formattedDate}");
      // log("right date = ${dt}");
      return formattedDate == dt;
    }).toList();
    if (list.isEmpty) {
      return null;
    }
    return list[0];
  }

  Future<void> refreshCalendar() async {
    await getAllEvents();
    return;
  }
}
