import 'package:flutter/cupertino.dart';

class UniversitySelectionVM extends ChangeNotifier {
  final universities = <String>[
    "University of Central Punjab",
    "University of Punjab",
    "University of Gujrat",
  ];

  String? selectedUniversity = "University of Central Punjab";

  void selectUniversity(String? value) {
    selectedUniversity = value;
    notifyListeners();
  }
}
