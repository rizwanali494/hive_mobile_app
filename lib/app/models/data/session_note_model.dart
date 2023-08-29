import 'package:isar/isar.dart';

part 'session_note_model.g.dart';

@collection
class SessionNoteModel {
  SessionNoteModel({
    this.id,
    this.localId = 0,
    this.dateAdded,
    this.dateLastModified,
    this.branchId,
    this.regionId,
    this.cityId,
    this.subject,
    this.content,
    this.state,
    this.owner,
    this.student,
  });

  SessionNoteModel.fromJson(dynamic json) {
    id = json['id'];
    localId = json['id'] ?? 0;
    dateAdded = json['date_added'];
    dateLastModified = json['date_last_modified'];
    branchId = json['branch_id'];
    regionId = json['region_id'];
    cityId = json['city_id'];
    subject = json['subject'];
    content = json['content'];
    state = json['state'];
    owner = json['owner'];
    student = json['student'];
  }

  int? id;
  late Id localId;
  String? dateAdded;
  String? dateLastModified;
  int? branchId;
  int? regionId;
  String? cityId;
  String? subject;
  String? content;
  String? state;
  int? owner;
  int? student;

  SessionNoteModel copyWith({
    int? id,
    int? localId,
    String? dateAdded,
    String? dateLastModified,
    int? branchId,
    int? regionId,
    String? cityId,
    String? subject,
    String? content,
    String? state,
    int? owner,
    int? student,
  }) =>
      SessionNoteModel(
        id: id ?? this.id,
        localId: localId ?? this.localId,
        dateAdded: dateAdded ?? this.dateAdded,
        dateLastModified: dateLastModified ?? this.dateLastModified,
        branchId: branchId ?? this.branchId,
        regionId: regionId ?? this.regionId,
        cityId: cityId ?? this.cityId,
        subject: subject ?? this.subject,
        content: content ?? this.content,
        state: state ?? this.state,
        owner: owner ?? this.owner,
        student: student ?? this.student,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['date_added'] = dateAdded;
    map['date_last_modified'] = dateLastModified;
    map['branch_id'] = branchId;
    map['region_id'] = regionId;
    map['city_id'] = cityId;
    map['subject'] = subject;
    map['content'] = content;
    map['state'] = state;
    map['owner'] = owner;
    map['student'] = student;
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionNoteModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
