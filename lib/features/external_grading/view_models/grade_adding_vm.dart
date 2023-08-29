import 'package:flutter/cupertino.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/attachments_model.dart';

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
