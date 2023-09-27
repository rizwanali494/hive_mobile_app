import 'package:flutter/material.dart';

class ReportsScreenVM extends ChangeNotifier {
  int selectedYear = -1;
  int selectedTerm = -1;

  void selectYear(int value) {
    selectedYear = value;
    notifyListeners();
  }

  void selectTerm(int value) {
    selectedTerm = value;
    notifyListeners();
  }
}

class Record {
  final String id;
  final String title;
  final String description;

  Record({required this.id, required this.title, required this.description});
}