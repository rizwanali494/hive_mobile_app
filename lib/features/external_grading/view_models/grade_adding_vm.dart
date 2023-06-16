import 'package:flutter/cupertino.dart';

class GradeAddingVM extends ChangeNotifier {
  final grades = [
    "A",
    "B+",
    "B",
    "C+",
    "C",
  ];

  String? selectedGrade = "A";

  void setGrade(String? value) {
    selectedGrade = value;
    notifyListeners();
  }
}
