class TermDetailsModel {
  final String? subjectName;
  final int? teacherId;
  final String? _teacherName;
  final String? attendance;
  final String? subjectPercentage;
  final String? _subjectGrade;
  final String? gpa;

  const TermDetailsModel({
    this.subjectName,
    this.teacherId,
    String? teacherName,
    this.attendance,
    this.subjectPercentage,
    String? subjectGrade,
    this.gpa,
  })  : this._teacherName = teacherName,
        this._subjectGrade = subjectGrade;

  bool get isValid =>
      (subjectPercentage != null) &&
      (subjectPercentage?.trim().isNotEmpty ?? false);

  String get teacherName {
    if (_teacherName == null || (_teacherName?.isEmpty ?? true)) {
      return "-";
    }
    return _teacherName ?? "-";
  }

  String get subjectGrade {
    if (this._subjectGrade == null || (_subjectGrade?.isEmpty ?? true)) {
      return "-";
    }
    return _subjectGrade ?? "-";
  }
}
