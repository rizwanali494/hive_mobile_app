import 'package:hive_mobile/app/view/util/util_functions.dart';

class SubjectVM {
  int? id;
  String name;
  String grade;
  bool isLocal;
  double gpa;

  SubjectVM(
      {required this.grade,
      required this.name,
    int? id,
    this.isLocal = true,
    required this.gpa}) {
    this.id = id ?? DateTime.now().millisecondsSinceEpoch;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SubjectVM && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  SubjectVM copyWith({
    int? id,
    String? name,
    String? grade,
    bool? isLocal,
    double? gpa,
  }) {
    return SubjectVM(
      id: id ?? this.id,
      name: name ?? this.name,
      grade: grade ?? this.grade,
      isLocal: isLocal ?? this.isLocal,
      gpa: gpa ?? this.gpa,
    );
  }

  bool validate() {
    final val = gpa ?? 0.0;

    final upperRange = gradeUpperRange[grade ?? ""] ?? 0;
    final lowerRange = gradeLowerRange[grade ?? ""] ?? 0;
    if (val < lowerRange || val > upperRange) {
      UtilFunctions.showToast(
          msg:
              "The range for an ${grade ?? ""} GPA is $lowerRange to $upperRange.");
      return false;
    }
    return true;
  }

  Map<String, double> gradeLowerRange = {
    "A*": 4.3,
    "A": 4.1,
    "B": 3.1,
    "C": 2.1,
    "D": 1.1,
    "E": 0.5
  };
  Map<String, double> gradeUpperRange = {
    "A*": 5.0,
    "A": 4.2,
    "B": 4.0,
    "C": 3.0,
    "D": 2.0,
    "E": 1.0
  };
}
