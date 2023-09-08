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
  final subjectCtrl = TextEditingController();
  final institute = TextEditingController();

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

  void addSubject() {
    final subjectName = subjectCtrl.text.trim();
    final hasSubject = subjectsVM
        .map((e) => e.name.toLowerCase())
        .toList()
        .contains(subjectName.toLowerCase());
    if (subjectName.isEmpty) {
      return;
    }
    if (!hasSubject) {
      final subject = SubjectVM(grade: selectedGrade!, name: subjectName);
      subjectsVM.add(subject);
    }
    subjectCtrl.clear();
    notifyListeners();
  }
}
