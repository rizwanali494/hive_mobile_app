import 'package:flutter/cupertino.dart';
import 'package:hive_mobile/features/external_grading/subject_vm.dart';

class SubjectEditVM with ChangeNotifier {
  final grades = [
    "A",
    "B+",
    "B",
    "C+",
    "C",
  ];

  SubjectVM subjectVM;

  SubjectEditVM({required this.subjectVM}) {
    selectedGrade = subjectVM.grade;
    subjectCtrl.text = subjectVM.name;
  }

  final subjectCtrl = TextEditingController();

  String? selectedGrade;

  void selectGrade(String grade) {
    selectedGrade = grade;
    notifyListeners();
  }
}
