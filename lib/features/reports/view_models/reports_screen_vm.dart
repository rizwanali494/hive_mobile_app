import 'package:flutter/material.dart';

class ReportsScreenVM extends ChangeNotifier {

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }


  List<Record> tab1Records = [
    Record(id: '1', title: 'Record 1', description: 'Description 1'),
    Record(id: '2', title: 'Record 2', description: 'Description 2'),
  ];

  List<Record> tab2Records = [
    Record(id: '3', title: 'Record 3', description: 'Description 3'),
    Record(id: '4', title: 'Record 4', description: 'Description 4'),
  ];

  List<String> dropdownItems = ['Item 1', 'Item 2', 'Item 3'];
  String selectedDropdownItem = 'Item 1';

  void setSelectedDropdownItem(String item) {
    selectedDropdownItem = item;
    notifyListeners();
  }

}
class Record {
  final String id;
  final String title;
  final String description;

  Record({required this.id, required this.title, required this.description});
}