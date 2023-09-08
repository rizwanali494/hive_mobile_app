import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hive_mobile/features/external_grading/subject_vm.dart';

class GradeAddingVM extends ChangeNotifier {
  final grades = [
    "A",
    "B+",
    "B",
    "C+",
    "C",
  ];
  String? selectedGrade = "A";

  GradeAddingVM({List<String> degrees = const []}) {
    setDegrees(degrees);
  }

  String? selectedDegree;

  List<String> degrees = [
    "A1",
    "A2",
    "O1",
    "O2",
  ];

  void setDegrees(List<String> deg) {
    for (var value in deg) {
      degrees.remove(value.toUpperCase());
    }
    selectedDegree =
        this.degrees.asMap().containsKey(0) ? this.degrees.first : null;
  }

  void selectDegree(String? value) {
    this.selectedDegree = value;
    notifyListeners();
  }

  void setGrade(String? value) {
    this.selectedGrade = value;
    notifyListeners();
  }

  List<SubjectVM> subjectsVM = [];

  void addSubject(String subjectName, String grade) {
    final subject = SubjectVM(grade: grade, name: subjectName);
    subjectsVM.add(subject);
    notifyListeners();
  }
}
