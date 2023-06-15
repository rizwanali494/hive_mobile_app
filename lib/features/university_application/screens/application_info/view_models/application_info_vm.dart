import 'package:flutter/cupertino.dart';

import 'package:hive_mobile/app/resources/app_strings.dart';

class ApplicationInfoVM extends ChangeNotifier {
  String _selectedStatus = AppStrings.applied;

  void selectStatus(String value) {
    _selectedStatus = value;
    notifyListeners();
  }

  bool iSelected(String value) {
    return value == _selectedStatus;
  }
}
