import 'package:isar/isar.dart';

part 's_extra_model.g.dart';

@embedded
class StudentExtra {
  StudentExtra({
    this.studentId,
    this.studentName,
    this.gender,
    this.dateOfBirth,
    this.studentEmail,
    this.studentMobile,
    this.studentAddress,
    this.bloodGroup,
    this.smsNumber,
    this.linkNumber,
    this.branchId,
    this.branchName,
    this.classId,
    this.className,
    this.classOrder,
    this.sectionId,
    this.sectionName,
    this.admissionDate,
    this.leftDate,
    this.lastPresentDate,
    this.academicYearTitle,
  });

  StudentExtra.fromJson(dynamic json) {
    studentId = json['student_id'];
    studentName = json['student_name'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    studentEmail = json['student_email'];
    studentMobile = json['student_mobile'];
    studentAddress = json['student_address'];
    bloodGroup = json['blood_group'];
    smsNumber = json['sms_number'];
    linkNumber = json['link_number'];
    branchId = json['branch_id'];
    branchName = json['branch_name'];
    classId = json['class_id'];
    className = json['class_name'];
    classOrder = json['class_order'];
    sectionId = json['section_id'];
    sectionName = json['section_name'];
    admissionDate = json['admission_date'];
    leftDate = json['left_date'];
    lastPresentDate = json['last_present_date'];
    academicYearTitle = json['acad_year_title'];
  }

  int? studentId;
  String? studentName;
  String? gender;
  String? dateOfBirth;
  String? studentEmail;
  String? studentMobile;
  String? studentAddress;
  String? bloodGroup;
  String? smsNumber;
  int? linkNumber;
  int? branchId;
  String? branchName;
  int? classId;
  String? className;
  int? classOrder;
  int? sectionId;
  String? sectionName;
  String? admissionDate;
  String? leftDate;
  String? lastPresentDate;
  String? academicYearTitle;

  StudentExtra copyWith({
    int? studentId,
    String? studentName,
    String? gender,
    String? dateOfBirth,
    String? studentEmail,
    String? studentMobile,
    String? studentAddress,
    String? bloodGroup,
    String? smsNumber,
    int? linkNumber,
    int? branchId,
    String? branchName,
    int? classId,
    String? className,
    int? classOrder,
    int? sectionId,
    String? sectionName,
    String? admissionDate,
    String? leftDate,
    String? lastPresentDate,
    String? academicYearTitle,
  }) =>
      StudentExtra(
        studentId: studentId ?? this.studentId,
        studentName: studentName ?? this.studentName,
        gender: gender ?? this.gender,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        studentEmail: studentEmail ?? this.studentEmail,
        studentMobile: studentMobile ?? this.studentMobile,
        studentAddress: studentAddress ?? this.studentAddress,
        bloodGroup: bloodGroup ?? this.bloodGroup,
        smsNumber: smsNumber ?? this.smsNumber,
        linkNumber: linkNumber ?? this.linkNumber,
        branchId: branchId ?? this.branchId,
        branchName: branchName ?? this.branchName,
        classId: classId ?? this.classId,
        className: className ?? this.className,
        classOrder: classOrder ?? this.classOrder,
        sectionId: sectionId ?? this.sectionId,
        sectionName: sectionName ?? this.sectionName,
        admissionDate: admissionDate ?? this.admissionDate,
        leftDate: leftDate ?? this.leftDate,
        lastPresentDate: lastPresentDate ?? this.lastPresentDate,
        academicYearTitle: academicYearTitle ?? this.academicYearTitle,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['student_id'] = studentId;
    map['student_name'] = studentName;
    map['gender'] = gender;
    map['date_of_birth'] = dateOfBirth;
    map['student_email'] = studentEmail;
    map['student_mobile'] = studentMobile;
    map['student_address'] = studentAddress;
    map['blood_group'] = bloodGroup;
    map['sms_number'] = smsNumber;
    map['link_number'] = linkNumber;
    map['branch_id'] = branchId;
    map['branch_name'] = branchName;
    map['class_id'] = classId;
    map['class_name'] = className;
    map['class_order'] = classOrder;
    map['section_id'] = sectionId;
    map['section_name'] = sectionName;
    map['admission_date'] = admissionDate;
    map['left_date'] = leftDate;
    map['last_present_date'] = lastPresentDate;
    map['acad_year_title'] = academicYearTitle;
    return map;
  }
}
