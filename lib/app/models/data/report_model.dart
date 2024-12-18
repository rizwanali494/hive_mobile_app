class ReportModel {
  ReportModel({
    this.systemId,
    this.grade,
    this.gpa,
    this.stdName,
    this.branchId,
    this.brName,
    this.acadYearId,
    this.acadYearTitle,
    this.termId,
    this.termName,
    this.classId,
    this.className,
    this.sectionId,
    this.sectionName,
    this.subjectId,
    this.subjectName,
    this.assessmentId,
    this.assessmentDesc,
    this.percentage,
    this.teacherId,
    this.teacherName,
    this.serialNo,
    this.attStatus,
    this.entryDate,
  });

  ReportModel.fromJson(dynamic json) {
    systemId = json['system_id'];
    grade = json['grade'];
    gpa = json['gpa'].toDouble();
    stdName = json['std_name'];
    branchId = json['branch_id'];
    brName = json['br_name'];
    acadYearId = json['acad_year_id'];
    acadYearTitle = json['acad_year_title'];
    termId = json['term_id'];
    termName = json['term_name'];
    classId = json['class_id'];
    className = json['class_name'];
    sectionId = json['section_id'];
    sectionName = json['section_name'];
    subjectId = json['subject_id'];
    subjectName = json['subject_name'];
    assessmentId = json['assessment_id'];
    assessmentDesc = json['assessment_desc'];
    percentage = json['percentage'].toDouble();
    teacherId = json['teacher_id'];
    teacherName = json['teacher_name'];
    serialNo = json['serial_no'];
    attStatus = json['att_status'];
    entryDate = json['entry_date'];
  }

  int? systemId;
  String? grade;
  double? gpa;
  String? stdName;
  int? branchId;
  String? brName;
  int? acadYearId;
  String? acadYearTitle;
  int? termId;
  String? termName;
  int? classId;
  String? className;
  int? sectionId;
  String? sectionName;
  int? subjectId;
  String? subjectName;
  int? assessmentId;
  String? assessmentDesc;
  double? percentage;
  int? teacherId;
  String? teacherName;
  int? serialNo;
  String? attStatus;
  String? entryDate;

  ReportModel copyWith({
    int? systemId,
    String? grade,
    double? gpa,
    String? stdName,
    int? branchId,
    String? brName,
    int? acadYearId,
    String? acadYearTitle,
    int? termId,
    String? termName,
    int? classId,
    String? className,
    int? sectionId,
    String? sectionName,
    int? subjectId,
    String? subjectName,
    int? assessmentId,
    String? assessmentDesc,
    double? percentage,
    int? teacherId,
    String? teacherName,
    int? serialNo,
    String? attStatus,
    String? entryDate,
  }) =>
      ReportModel(
        systemId: systemId ?? this.systemId,
        grade: grade ?? this.grade,
        gpa: gpa ?? this.gpa,
        stdName: stdName ?? this.stdName,
        branchId: branchId ?? this.branchId,
        brName: brName ?? this.brName,
        acadYearId: acadYearId ?? this.acadYearId,
        acadYearTitle: acadYearTitle ?? this.acadYearTitle,
        termId: termId ?? this.termId,
        termName: termName ?? this.termName,
        classId: classId ?? this.classId,
        className: className ?? this.className,
        sectionId: sectionId ?? this.sectionId,
        sectionName: sectionName ?? this.sectionName,
        subjectId: subjectId ?? this.subjectId,
        subjectName: subjectName ?? this.subjectName,
        assessmentId: assessmentId ?? this.assessmentId,
        assessmentDesc: assessmentDesc ?? this.assessmentDesc,
        percentage: percentage ?? this.percentage,
        teacherId: teacherId ?? this.teacherId,
        teacherName: teacherName ?? this.teacherName,
        serialNo: serialNo ?? this.serialNo,
        attStatus: attStatus ?? this.attStatus,
        entryDate: entryDate ?? this.entryDate,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['system_id'] = systemId;
    map['grade'] = grade;
    map['gpa'] = gpa;
    map['std_name'] = stdName;
    map['branch_id'] = branchId;
    map['br_name'] = brName;
    map['acad_year_id'] = acadYearId;
    map['acad_year_title'] = acadYearTitle;
    map['term_id'] = termId;
    map['term_name'] = termName;
    map['class_id'] = classId;
    map['class_name'] = className;
    map['section_id'] = sectionId;
    map['section_name'] = sectionName;
    map['subject_id'] = subjectId;
    map['subject_name'] = subjectName;
    map['assessment_id'] = assessmentId;
    map['assessment_desc'] = assessmentDesc;
    map['percentage'] = percentage;
    map['teacher_id'] = teacherId;
    map['teacher_name'] = teacherName;
    map['serial_no'] = serialNo;
    map['att_status'] = attStatus;
    map['entry_date'] = entryDate;
    return map;
  }

  final _year1Ids = [1, 3, 5, 19];
  final _year2Ids = [9, 11, 13, 15];
  final _term1Ids = [1, 3, 9, 11];
  final _term2Ids = [5, 19, 13, 15];
  final _midTermAssessmentIds = [1, 9];
  final _mockTermAssessmentIds = [5, 13];
  final _mockExamIds = [19, 15];
  final _midYearExam = [3, 11];

  bool get isYear1 => _year1Ids.contains(assessmentId);

  bool get isYear2 => _year2Ids.contains(assessmentId);

  bool get isTerm1 => _term1Ids.contains(assessmentId);

  bool get isTerm2 => _term2Ids.contains(assessmentId);

  bool get isMidTermAssessment => _midTermAssessmentIds.contains(assessmentId);

  bool get isMockTermAssessment =>
      _mockTermAssessmentIds.contains(assessmentId);

  bool get isMockExam => _mockExamIds.contains(assessmentId);

  bool get isMidYearExam => _midYearExam.contains(assessmentId);
}
