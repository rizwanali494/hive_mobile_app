class SubjectVM {
  int? id;
  String name;
  String grade;
  bool isLocal;

  SubjectVM(
      {required this.grade, required this.name, int? id, this.isLocal = true}) {
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
  }) {
    return SubjectVM(
      id: id ?? this.id,
      name: name ?? this.name,
      grade: grade ?? this.grade,
      isLocal: isLocal ?? this.isLocal,
    );
  }
}
