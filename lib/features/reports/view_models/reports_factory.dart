class ReportsFactory {
  static _ReportYear get reportYear1 => _ReportYear(
        reportTerm1: _ReportTerm(midTermId: 1, midYearExamId: 3),
        reportTerm2: _ReportTerm(mockTermId: 5, mockExamId: 19),
      );

  static _ReportYear get reportYear2 => _ReportYear(
        reportTerm1: _ReportTerm(midTermId: 9, midYearExamId: 11),
        reportTerm2: _ReportTerm(mockTermId: 13, mockExamId: 15),
      );
}

class _ReportYear {
  final _ReportTerm reportTerm1;
  final _ReportTerm reportTerm2;

  const _ReportYear({
    required this.reportTerm1,
    required this.reportTerm2,
  });
}

class _ReportTerm {
  final int? midTermId;
  final int? mockTermId;
  final int? midYearExamId;
  final int? mockExamId;

  const _ReportTerm({
    this.midTermId,
    this.mockTermId,
    this.midYearExamId,
    this.mockExamId,
  });
}
