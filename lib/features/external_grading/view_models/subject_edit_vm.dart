import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hive_mobile/features/external_grading/view_models/subject_vm.dart';

class SubjectEditVM with ChangeNotifier {
  final grades = ["A*", "A", "B", "C", "D", "E"];

  SubjectVM subjectVM;

  SubjectEditVM({required this.subjectVM}) {
    selectedGrade = subjectVM.grade;
    subjectCtrl.text = subjectVM.name;
    log("message  :: ${subjectVM.gpa}");
    gpaCtrl.text = subjectVM.gpa.toStringAsPrecision(3);
  }

  final subjectCtrl = TextEditingController();
  final gpaCtrl = TextEditingController();

  String? selectedGrade;

  void selectGrade(String grade) {
    selectedGrade = grade;
    notifyListeners();
  }
}
