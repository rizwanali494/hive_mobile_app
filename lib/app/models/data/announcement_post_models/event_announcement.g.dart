// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_announcement.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const EventAnnouncementModelSchema = Schema(
  name: r'EventAnnouncementModel',
  id: 6399775118683999081,
  properties: {
    r'attendingStudents': PropertySchema(
      id: 0,
      name: r'attendingStudents',
      type: IsarType.long,
    ),
    r'banner': PropertySchema(
      id: 1,
      name: r'banner',
      type: IsarType.object,
      target: r'Attachments',
    ),
    r'bio': PropertySchema(
      id: 2,
      name: r'bio',
      type: IsarType.string,
    ),
    r'branchId': PropertySchema(
      id: 3,
      name: r'branchId',
      type: IsarType.long,
    ),
    r'cityId': PropertySchema(
      id: 4,
      name: r'cityId',
      type: IsarType.long,
    ),
    r'date': PropertySchema(
      id: 5,
      name: r'date',
      type: IsarType.string,
    ),
    r'dateAdded': PropertySchema(
      id: 6,
      name: r'dateAdded',
      type: IsarType.string,
    ),
    r'dateLastModified': PropertySchema(
      id: 7,
      name: r'dateLastModified',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 8,
      name: r'description',
      type: IsarType.string,
    ),
    r'hashCode': PropertySchema(
      id: 9,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'id': PropertySchema(
      id: 10,
      name: r'id',
      type: IsarType.long,
    ),
    r'location': PropertySchema(
      id: 11,
      name: r'location',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 12,
      name: r'name',
      type: IsarType.string,
    ),
    r'nonAttendingStudents': PropertySchema(
      id: 13,
      name: r'nonAttendingStudents',
      type: IsarType.long,
    ),
    r'owner': PropertySchema(
      id: 14,
      name: r'owner',
      type: IsarType.object,
      target: r'OwnerModel',
    ),
    r'regionId': PropertySchema(
      id: 15,
      name: r'regionId',
      type: IsarType.long,
    ),
    r'selection': PropertySchema(
      id: 16,
      name: r'selection',
      type: IsarType.string,
    ),
    r'skepticalStudents': PropertySchema(
      id: 17,
      name: r'skepticalStudents',
      type: IsarType.long,
    )
  },
  estimateSize: _eventAnnouncementModelEstimateSize,
  serialize: _eventAnnouncementModelSerialize,
  deserialize: _eventAnnouncementModelDeserialize,
  deserializeProp: _eventAnnouncementModelDeserializeProp,
);

int _eventAnnouncementModelEstimateSize(
  EventAnnouncementModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.banner;
    if (value != null) {
      bytesCount += 3 +
          AttachmentsSchema.estimateSize(
              value, allOffsets[Attachments]!, allOffsets);
    }
  }
  {
    final value = object.bio;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.date;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.dateAdded;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.dateLastModified;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.location;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.owner;
    if (value != null) {
      bytesCount += 3 +
          OwnerModelSchema.estimateSize(
              value, allOffsets[OwnerModel]!, allOffsets);
    }
  }
  {
    final value = object.selection;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _eventAnnouncementModelSerialize(
  EventAnnouncementModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.attendingStudents);
  writer.writeObject<Attachments>(
    offsets[1],
    allOffsets,
    AttachmentsSchema.serialize,
    object.banner,
  );
  writer.writeString(offsets[2], object.bio);
  writer.writeLong(offsets[3], object.branchId);
  writer.writeLong(offsets[4], object.cityId);
  writer.writeString(offsets[5], object.date);
  writer.writeString(offsets[6], object.dateAdded);
  writer.writeString(offsets[7], object.dateLastModified);
  writer.writeString(offsets[8], object.description);
  writer.writeLong(offsets[9], object.hashCode);
  writer.writeLong(offsets[10], object.id);
  writer.writeString(offsets[11], object.location);
  writer.writeString(offsets[12], object.name);
  writer.writeLong(offsets[13], object.nonAttendingStudents);
  writer.writeObject<OwnerModel>(
    offsets[14],
    allOffsets,
    OwnerModelSchema.serialize,
    object.owner,
  );
  writer.writeLong(offsets[15], object.regionId);
  writer.writeString(offsets[16], object.selection);
  writer.writeLong(offsets[17], object.skepticalStudents);
}

EventAnnouncementModel _eventAnnouncementModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EventAnnouncementModel(
    attendingStudents: reader.readLongOrNull(offsets[0]),
    banner: reader.readObjectOrNull<Attachments>(
      offsets[1],
      AttachmentsSchema.deserialize,
      allOffsets,
    ),
    bio: reader.readStringOrNull(offsets[2]),
    branchId: reader.readLongOrNull(offsets[3]),
    cityId: reader.readLongOrNull(offsets[4]),
    date: reader.readStringOrNull(offsets[5]),
    dateAdded: reader.readStringOrNull(offsets[6]),
    dateLastModified: reader.readStringOrNull(offsets[7]),
    description: reader.readStringOrNull(offsets[8]),
    id: reader.readLongOrNull(offsets[10]),
    location: reader.readStringOrNull(offsets[11]),
    name: reader.readStringOrNull(offsets[12]),
    nonAttendingStudents: reader.readLongOrNull(offsets[13]),
    owner: reader.readObjectOrNull<OwnerModel>(
      offsets[14],
      OwnerModelSchema.deserialize,
      allOffsets,
    ),
    regionId: reader.readLongOrNull(offsets[15]),
    selection: reader.readStringOrNull(offsets[16]),
    skepticalStudents: reader.readLongOrNull(offsets[17]),
  );
  return object;
}

P _eventAnnouncementModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<Attachments>(
        offset,
        AttachmentsSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readObjectOrNull<OwnerModel>(
        offset,
        OwnerModelSchema.deserialize,
        allOffsets,
      )) as P;
    case 15:
      return (reader.readLongOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension EventAnnouncementModelQueryFilter on QueryBuilder<
    EventAnnouncementModel, EventAnnouncementModel, QFilterCondition> {
  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> attendingStudentsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attendingStudents',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> attendingStudentsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attendingStudents',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> attendingStudentsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attendingStudents',
        value: value,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> attendingStudentsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'attendingStudents',
        value: value,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> attendingStudentsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'attendingStudents',
        value: value,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> attendingStudentsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'attendingStudents',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> bannerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'banner',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> bannerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'banner',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> bioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bio',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> bioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bio',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> bioEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> bioGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> bioLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> bioBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> bioStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> bioEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
          QAfterFilterCondition>
      bioContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
          QAfterFilterCondition>
      bioMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bio',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> bioIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bio',
        value: '',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> bioIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bio',
        value: '',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> branchIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'branchId',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> branchIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'branchId',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> branchIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'branchId',
        value: value,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> branchIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'branchId',
        value: value,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> branchIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'branchId',
        value: value,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> branchIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'branchId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> cityIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cityId',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> cityIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cityId',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> cityIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cityId',
        value: value,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> cityIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cityId',
        value: value,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> cityIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cityId',
        value: value,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> cityIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cityId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> dateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> dateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> dateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> dateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> dateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> dateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> dateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> dateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
          QAfterFilterCondition>
      dateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
          QAfterFilterCondition>
      dateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'date',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> dateAddedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateAdded',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> dateAddedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateAdded',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> dateAddedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateAdded',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> dateAddedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateAdded',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> dateAddedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateAdded',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> dateAddedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateAdded',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> dateAddedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dateAdded',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> dateAddedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dateAdded',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
          QAfterFilterCondition>
      dateAddedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dateAdded',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
          QAfterFilterCondition>
      dateAddedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dateAdded',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> dateAddedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateAdded',
        value: '',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> dateAddedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dateAdded',
        value: '',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> dateLastModifiedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateLastModified',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> dateLastModifiedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateLastModified',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> dateLastModifiedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateLastModified',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> dateLastModifiedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateLastModified',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> dateLastModifiedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateLastModified',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> dateLastModifiedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateLastModified',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> dateLastModifiedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dateLastModified',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> dateLastModifiedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dateLastModified',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
          QAfterFilterCondition>
      dateLastModifiedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dateLastModified',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
          QAfterFilterCondition>
      dateLastModifiedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dateLastModified',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> dateLastModifiedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateLastModified',
        value: '',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> dateLastModifiedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dateLastModified',
        value: '',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
          QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
          QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> idLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> idBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> locationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> locationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> locationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> locationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> locationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> locationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'location',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> locationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> locationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
          QAfterFilterCondition>
      locationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
          QAfterFilterCondition>
      locationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'location',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> locationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> locationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> nonAttendingStudentsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nonAttendingStudents',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> nonAttendingStudentsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nonAttendingStudents',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> nonAttendingStudentsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nonAttendingStudents',
        value: value,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> nonAttendingStudentsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nonAttendingStudents',
        value: value,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> nonAttendingStudentsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nonAttendingStudents',
        value: value,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> nonAttendingStudentsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nonAttendingStudents',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> ownerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'owner',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> ownerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'owner',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> regionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'regionId',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> regionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'regionId',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> regionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'regionId',
        value: value,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> regionIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'regionId',
        value: value,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> regionIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'regionId',
        value: value,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> regionIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'regionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> selectionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'selection',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> selectionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'selection',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> selectionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selection',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> selectionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'selection',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> selectionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'selection',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> selectionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'selection',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> selectionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'selection',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> selectionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'selection',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
          QAfterFilterCondition>
      selectionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'selection',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
          QAfterFilterCondition>
      selectionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'selection',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> selectionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selection',
        value: '',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> selectionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'selection',
        value: '',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> skepticalStudentsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'skepticalStudents',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> skepticalStudentsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'skepticalStudents',
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> skepticalStudentsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skepticalStudents',
        value: value,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> skepticalStudentsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'skepticalStudents',
        value: value,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> skepticalStudentsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'skepticalStudents',
        value: value,
      ));
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> skepticalStudentsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'skepticalStudents',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension EventAnnouncementModelQueryObject on QueryBuilder<
    EventAnnouncementModel, EventAnnouncementModel, QFilterCondition> {
  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> banner(FilterQuery<Attachments> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'banner');
    });
  }

  QueryBuilder<EventAnnouncementModel, EventAnnouncementModel,
      QAfterFilterCondition> owner(FilterQuery<OwnerModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'owner');
    });
  }
}
