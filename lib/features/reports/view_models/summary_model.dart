class ReportSummaryModel {
  final double meanGPA;
  final double topGPA;
  final double bottomGPA;

  const ReportSummaryModel(
      {this.meanGPA = 0, this.bottomGPA = 0, this.topGPA = 0});

  Map<String, dynamic> toMap() {
    return {
      'avg_gpa': this.meanGPA,
      'max_gpa': this.topGPA,
      'min_gpa': this.bottomGPA,
    };
  }

  factory ReportSummaryModel.fromMap(Map<String, dynamic> map) {
    return ReportSummaryModel(
      meanGPA: map['avg_gpa'] as double,
      topGPA: map['max_gpa'] as double,
      bottomGPA: map['min_gpa'] as double,
    );
  }
}
