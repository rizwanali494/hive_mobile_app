class ReportIdModel {
  final midTermAssessmentId;

  final mockTermAssessmentId;

  final midYearId;

  final mockExam;

  const ReportIdModel({
    required this.midTermAssessmentId,
    required this.mockTermAssessmentId,
    required this.midYearId,
    required this.mockExam,
  });

  List<int> get allIds {
    return [
      midTermAssessmentId,
      mockTermAssessmentId,
      midYearId,
      mockExam,
    ];
  }

  List<int> get term1Ids {
    return [
      midTermAssessmentId,
      midYearId,
    ];
  }

  List<int> get term2Ids {
    return [
      mockTermAssessmentId,
      mockExam,
    ];
  }
}
