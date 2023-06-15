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

  final List<String> _items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? _selectedValue;

  String? get selectedValue => _selectedValue;
  List<String> get items => _items;

  void setSelectedValue(String value) {
    _selectedValue = value;
    notifyListeners();
  }
}
class Record {
  final String id;
  final String title;
  final String description;

  Record({required this.id, required this.title, required this.description});
}