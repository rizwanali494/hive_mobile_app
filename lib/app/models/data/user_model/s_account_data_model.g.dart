// GENERATED CODE - DO NOT MODIFY BY HAND

part of 's_account_data_model.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const StudentAccountDataSchema = Schema(
  name: r'StudentAccountData',
  id: -8016974742716945745,
  properties: {
    r'backupEmail': PropertySchema(
      id: 0,
      name: r'backupEmail',
      type: IsarType.string,
    ),
    r'branchId': PropertySchema(
      id: 1,
      name: r'branchId',
      type: IsarType.long,
    ),
    r'cityId': PropertySchema(
      id: 2,
      name: r'cityId',
      type: IsarType.long,
    ),
    r'classId': PropertySchema(
      id: 3,
      name: r'classId',
      type: IsarType.long,
    ),
    r'dateAdded': PropertySchema(
      id: 4,
      name: r'dateAdded',
      type: IsarType.string,
    ),
    r'dateLastModified': PropertySchema(
      id: 5,
      name: r'dateLastModified',
      type: IsarType.string,
    ),
    r'extra': PropertySchema(
      id: 6,
      name: r'extra',
      type: IsarType.object,
      target: r'StudentExtra',
    ),
    r'hobbies': PropertySchema(
      id: 7,
      name: r'hobbies',
      type: IsarType.objectList,
      target: r'HobbiesModel',
    ),
    r'id': PropertySchema(
      id: 8,
      name: r'id',
      type: IsarType.long,
    ),
    r'isBackUpEmailVerified': PropertySchema(
      id: 9,
      name: r'isBackUpEmailVerified',
      type: IsarType.bool,
    ),
    r'owner': PropertySchema(
      id: 10,
      name: r'owner',
      type: IsarType.long,
    ),
    r'regionId': PropertySchema(
      id: 11,
      name: r'regionId',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 12,
      name: r'status',
      type: IsarType.string,
    )
  },
  estimateSize: _studentAccountDataEstimateSize,
  serialize: _studentAccountDataSerialize,
  deserialize: _studentAccountDataDeserialize,
  deserializeProp: _studentAccountDataDeserializeProp,
);

int _studentAccountDataEstimateSize(
  StudentAccountData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.backupEmail;
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
    final value = object.extra;
    if (value != null) {
      bytesCount += 3 +
          StudentExtraSchema.estimateSize(
              value, allOffsets[StudentExtra]!, allOffsets);
    }
  }
  {
    final list = object.hobbies;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[HobbiesModel]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              HobbiesModelSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.status;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _studentAccountDataSerialize(
  StudentAccountData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.backupEmail);
  writer.writeLong(offsets[1], object.branchId);
  writer.writeLong(offsets[2], object.cityId);
  writer.writeLong(offsets[3], object.classId);
  writer.writeString(offsets[4], object.dateAdded);
  writer.writeString(offsets[5], object.dateLastModified);
  writer.writeObject<StudentExtra>(
    offsets[6],
    allOffsets,
    StudentExtraSchema.serialize,
    object.extra,
  );
  writer.writeObjectList<HobbiesModel>(
    offsets[7],
    allOffsets,
    HobbiesModelSchema.serialize,
    object.hobbies,
  );
  writer.writeLong(offsets[8], object.id);
  writer.writeBool(offsets[9], object.isBackUpEmailVerified);
  writer.writeLong(offsets[10], object.owner);
  writer.writeLong(offsets[11], object.regionId);
  writer.writeString(offsets[12], object.status);
}

StudentAccountData _studentAccountDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StudentAccountData(
    backupEmail: reader.readStringOrNull(offsets[0]),
    branchId: reader.readLongOrNull(offsets[1]),
    cityId: reader.readLongOrNull(offsets[2]),
    classId: reader.readLongOrNull(offsets[3]),
    dateAdded: reader.readStringOrNull(offsets[4]),
    dateLastModified: reader.readStringOrNull(offsets[5]),
    extra: reader.readObjectOrNull<StudentExtra>(
      offsets[6],
      StudentExtraSchema.deserialize,
      allOffsets,
    ),
    hobbies: reader.readObjectList<HobbiesModel>(
      offsets[7],
      HobbiesModelSchema.deserialize,
      allOffsets,
      HobbiesModel(),
    ),
    id: reader.readLongOrNull(offsets[8]),
    isBackUpEmailVerified: reader.readBoolOrNull(offsets[9]),
    owner: reader.readLongOrNull(offsets[10]),
    regionId: reader.readLongOrNull(offsets[11]),
    status: reader.readStringOrNull(offsets[12]),
  );
  return object;
}

P _studentAccountDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readObjectOrNull<StudentExtra>(
        offset,
        StudentExtraSchema.deserialize,
        allOffsets,
      )) as P;
    case 7:
      return (reader.readObjectList<HobbiesModel>(
        offset,
        HobbiesModelSchema.deserialize,
        allOffsets,
        HobbiesModel(),
      )) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readBoolOrNull(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension StudentAccountDataQueryFilter
    on QueryBuilder<StudentAccountData, StudentAccountData, QFilterCondition> {
  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      backupEmailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backupEmail',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      backupEmailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backupEmail',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      backupEmailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backupEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      backupEmailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backupEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      backupEmailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backupEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      backupEmailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backupEmail',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      backupEmailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backupEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      backupEmailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backupEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      backupEmailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backupEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      backupEmailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backupEmail',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      backupEmailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backupEmail',
        value: '',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      backupEmailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backupEmail',
        value: '',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      branchIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'branchId',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      branchIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'branchId',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      branchIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'branchId',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      branchIdGreaterThan(
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

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      branchIdLessThan(
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

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      branchIdBetween(
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

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      cityIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cityId',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      cityIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cityId',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      cityIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cityId',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      cityIdGreaterThan(
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

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      cityIdLessThan(
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

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      cityIdBetween(
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

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      classIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'classId',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      classIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'classId',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      classIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'classId',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      classIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'classId',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      classIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'classId',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      classIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'classId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      dateAddedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateAdded',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      dateAddedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateAdded',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      dateAddedEqualTo(
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

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      dateAddedGreaterThan(
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

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      dateAddedLessThan(
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

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      dateAddedBetween(
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

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      dateAddedStartsWith(
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

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      dateAddedEndsWith(
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

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      dateAddedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dateAdded',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      dateAddedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dateAdded',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      dateAddedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateAdded',
        value: '',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      dateAddedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dateAdded',
        value: '',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      dateLastModifiedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateLastModified',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      dateLastModifiedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateLastModified',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      dateLastModifiedEqualTo(
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

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      dateLastModifiedGreaterThan(
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

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      dateLastModifiedLessThan(
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

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      dateLastModifiedBetween(
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

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      dateLastModifiedStartsWith(
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

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      dateLastModifiedEndsWith(
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

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      dateLastModifiedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dateLastModified',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      dateLastModifiedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dateLastModified',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      dateLastModifiedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateLastModified',
        value: '',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      dateLastModifiedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dateLastModified',
        value: '',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      extraIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'extra',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      extraIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'extra',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      hobbiesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hobbies',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      hobbiesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hobbies',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      hobbiesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'hobbies',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      hobbiesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'hobbies',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      hobbiesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'hobbies',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      hobbiesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'hobbies',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      hobbiesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'hobbies',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      hobbiesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'hobbies',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      isBackUpEmailVerifiedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isBackUpEmailVerified',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      isBackUpEmailVerifiedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isBackUpEmailVerified',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      isBackUpEmailVerifiedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isBackUpEmailVerified',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      ownerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'owner',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      ownerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'owner',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      ownerEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'owner',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      ownerGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'owner',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      ownerLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'owner',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      ownerBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'owner',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      regionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'regionId',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      regionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'regionId',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      regionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'regionId',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      regionIdGreaterThan(
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

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      regionIdLessThan(
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

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      regionIdBetween(
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

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      statusEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      statusGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      statusLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      statusBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }
}

extension StudentAccountDataQueryObject
    on QueryBuilder<StudentAccountData, StudentAccountData, QFilterCondition> {
  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      extra(FilterQuery<StudentExtra> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'extra');
    });
  }

  QueryBuilder<StudentAccountData, StudentAccountData, QAfterFilterCondition>
      hobbiesElement(FilterQuery<HobbiesModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'hobbies');
    });
  }
}
