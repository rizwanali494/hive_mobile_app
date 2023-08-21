// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'university_application_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUniversityApplicationModelCollection on Isar {
  IsarCollection<UniversityApplicationModel> get universityApplicationModels =>
      this.collection();
}

const UniversityApplicationModelSchema = CollectionSchema(
  name: r'UniversityApplicationModel',
  id: -5619895616009792393,
  properties: {
    r'branchId': PropertySchema(
      id: 0,
      name: r'branchId',
      type: IsarType.long,
    ),
    r'cityId': PropertySchema(
      id: 1,
      name: r'cityId',
      type: IsarType.long,
    ),
    r'comments': PropertySchema(
      id: 2,
      name: r'comments',
      type: IsarType.string,
    ),
    r'dateAdded': PropertySchema(
      id: 3,
      name: r'dateAdded',
      type: IsarType.string,
    ),
    r'dateLastModified': PropertySchema(
      id: 4,
      name: r'dateLastModified',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 5,
      name: r'description',
      type: IsarType.string,
    ),
    r'documents': PropertySchema(
      id: 6,
      name: r'documents',
      type: IsarType.objectList,
      target: r'Attachments',
    ),
    r'hashCode': PropertySchema(
      id: 7,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'id': PropertySchema(
      id: 8,
      name: r'id',
      type: IsarType.long,
    ),
    r'owner': PropertySchema(
      id: 9,
      name: r'owner',
      type: IsarType.long,
    ),
    r'regionId': PropertySchema(
      id: 10,
      name: r'regionId',
      type: IsarType.long,
    ),
    r'scholarshipAmount': PropertySchema(
      id: 11,
      name: r'scholarshipAmount',
      type: IsarType.string,
    ),
    r'scholarshipPercent': PropertySchema(
      id: 12,
      name: r'scholarshipPercent',
      type: IsarType.string,
    ),
    r'state': PropertySchema(
      id: 13,
      name: r'state',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 14,
      name: r'status',
      type: IsarType.string,
    ),
    r'university': PropertySchema(
      id: 15,
      name: r'university',
      type: IsarType.object,
      target: r'UniversityModel',
    )
  },
  estimateSize: _universityApplicationModelEstimateSize,
  serialize: _universityApplicationModelSerialize,
  deserialize: _universityApplicationModelDeserialize,
  deserializeProp: _universityApplicationModelDeserializeProp,
  idName: r'localId',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'UniversityModel': UniversityModelSchema,
    r'Attachments': AttachmentsSchema
  },
  getId: _universityApplicationModelGetId,
  getLinks: _universityApplicationModelGetLinks,
  attach: _universityApplicationModelAttach,
  version: '3.1.0+1',
);

int _universityApplicationModelEstimateSize(
  UniversityApplicationModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.comments;
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
    final list = object.documents;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Attachments]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              AttachmentsSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.scholarshipAmount;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.scholarshipPercent;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.state;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.status;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.university;
    if (value != null) {
      bytesCount += 3 +
          UniversityModelSchema.estimateSize(
              value, allOffsets[UniversityModel]!, allOffsets);
    }
  }
  return bytesCount;
}

void _universityApplicationModelSerialize(
  UniversityApplicationModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.branchId);
  writer.writeLong(offsets[1], object.cityId);
  writer.writeString(offsets[2], object.comments);
  writer.writeString(offsets[3], object.dateAdded);
  writer.writeString(offsets[4], object.dateLastModified);
  writer.writeString(offsets[5], object.description);
  writer.writeObjectList<Attachments>(
    offsets[6],
    allOffsets,
    AttachmentsSchema.serialize,
    object.documents,
  );
  writer.writeLong(offsets[7], object.hashCode);
  writer.writeLong(offsets[8], object.id);
  writer.writeLong(offsets[9], object.owner);
  writer.writeLong(offsets[10], object.regionId);
  writer.writeString(offsets[11], object.scholarshipAmount);
  writer.writeString(offsets[12], object.scholarshipPercent);
  writer.writeString(offsets[13], object.state);
  writer.writeString(offsets[14], object.status);
  writer.writeObject<UniversityModel>(
    offsets[15],
    allOffsets,
    UniversityModelSchema.serialize,
    object.university,
  );
}

UniversityApplicationModel _universityApplicationModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UniversityApplicationModel(
    branchId: reader.readLongOrNull(offsets[0]),
    cityId: reader.readLongOrNull(offsets[1]),
    comments: reader.readStringOrNull(offsets[2]),
    dateAdded: reader.readStringOrNull(offsets[3]),
    dateLastModified: reader.readStringOrNull(offsets[4]),
    description: reader.readStringOrNull(offsets[5]),
    documents: reader.readObjectList<Attachments>(
      offsets[6],
      AttachmentsSchema.deserialize,
      allOffsets,
      Attachments(),
    ),
    id: reader.readLongOrNull(offsets[8]),
    localId: id,
    owner: reader.readLongOrNull(offsets[9]),
    regionId: reader.readLongOrNull(offsets[10]),
    scholarshipAmount: reader.readStringOrNull(offsets[11]),
    scholarshipPercent: reader.readStringOrNull(offsets[12]),
    state: reader.readStringOrNull(offsets[13]),
    status: reader.readStringOrNull(offsets[14]),
    university: reader.readObjectOrNull<UniversityModel>(
      offsets[15],
      UniversityModelSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _universityApplicationModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readObjectList<Attachments>(
        offset,
        AttachmentsSchema.deserialize,
        allOffsets,
        Attachments(),
      )) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readObjectOrNull<UniversityModel>(
        offset,
        UniversityModelSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _universityApplicationModelGetId(UniversityApplicationModel object) {
  return object.localId;
}

List<IsarLinkBase<dynamic>> _universityApplicationModelGetLinks(
    UniversityApplicationModel object) {
  return [];
}

void _universityApplicationModelAttach(
    IsarCollection<dynamic> col, Id id, UniversityApplicationModel object) {
  object.localId = id;
}

extension UniversityApplicationModelQueryWhereSort on QueryBuilder<
    UniversityApplicationModel, UniversityApplicationModel, QWhere> {
  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterWhere> anyLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UniversityApplicationModelQueryWhere on QueryBuilder<
    UniversityApplicationModel, UniversityApplicationModel, QWhereClause> {
  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterWhereClause> localIdEqualTo(Id localId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: localId,
        upper: localId,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterWhereClause> localIdNotEqualTo(Id localId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: localId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: localId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: localId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: localId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
          QAfterWhereClause>
      localIdGreaterThan(Id localId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: localId, includeLower: include),
      );
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterWhereClause> localIdLessThan(Id localId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: localId, includeUpper: include),
      );
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterWhereClause> localIdBetween(
    Id lowerLocalId,
    Id upperLocalId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerLocalId,
        includeLower: includeLower,
        upper: upperLocalId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension UniversityApplicationModelQueryFilter on QueryBuilder<
    UniversityApplicationModel, UniversityApplicationModel, QFilterCondition> {
  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> branchIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'branchId',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> branchIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'branchId',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> branchIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'branchId',
        value: value,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> cityIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cityId',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> cityIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cityId',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> cityIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cityId',
        value: value,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> commentsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'comments',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> commentsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'comments',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> commentsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> commentsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> commentsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> commentsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'comments',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> commentsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> commentsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
          QAfterFilterCondition>
      commentsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
          QAfterFilterCondition>
      commentsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'comments',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> commentsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comments',
        value: '',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> commentsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'comments',
        value: '',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> dateAddedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateAdded',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> dateAddedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateAdded',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> dateAddedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateAdded',
        value: '',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> dateAddedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dateAdded',
        value: '',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> dateLastModifiedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateLastModified',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> dateLastModifiedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateLastModified',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> dateLastModifiedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateLastModified',
        value: '',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> dateLastModifiedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dateLastModified',
        value: '',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> documentsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'documents',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> documentsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'documents',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> documentsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'documents',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> documentsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'documents',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> documentsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'documents',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> documentsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'documents',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> documentsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'documents',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> documentsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'documents',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> localIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localId',
        value: value,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> localIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'localId',
        value: value,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> localIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'localId',
        value: value,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> localIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'localId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> ownerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'owner',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> ownerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'owner',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> ownerEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'owner',
        value: value,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> ownerGreaterThan(
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> ownerLessThan(
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> ownerBetween(
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> regionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'regionId',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> regionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'regionId',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> regionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'regionId',
        value: value,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> scholarshipAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'scholarshipAmount',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> scholarshipAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'scholarshipAmount',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> scholarshipAmountEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scholarshipAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> scholarshipAmountGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scholarshipAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> scholarshipAmountLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scholarshipAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> scholarshipAmountBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scholarshipAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> scholarshipAmountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'scholarshipAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> scholarshipAmountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'scholarshipAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
          QAfterFilterCondition>
      scholarshipAmountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'scholarshipAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
          QAfterFilterCondition>
      scholarshipAmountMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'scholarshipAmount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> scholarshipAmountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scholarshipAmount',
        value: '',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> scholarshipAmountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'scholarshipAmount',
        value: '',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> scholarshipPercentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'scholarshipPercent',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> scholarshipPercentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'scholarshipPercent',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> scholarshipPercentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scholarshipPercent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> scholarshipPercentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scholarshipPercent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> scholarshipPercentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scholarshipPercent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> scholarshipPercentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scholarshipPercent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> scholarshipPercentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'scholarshipPercent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> scholarshipPercentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'scholarshipPercent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
          QAfterFilterCondition>
      scholarshipPercentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'scholarshipPercent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
          QAfterFilterCondition>
      scholarshipPercentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'scholarshipPercent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> scholarshipPercentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scholarshipPercent',
        value: '',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> scholarshipPercentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'scholarshipPercent',
        value: '',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> stateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'state',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> stateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'state',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> stateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> stateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> stateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> stateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'state',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> stateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> stateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
          QAfterFilterCondition>
      stateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
          QAfterFilterCondition>
      stateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'state',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> stateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'state',
        value: '',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> stateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'state',
        value: '',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> statusEqualTo(
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> statusGreaterThan(
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> statusLessThan(
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> statusBetween(
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> statusStartsWith(
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
          QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
          QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> universityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'university',
      ));
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> universityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'university',
      ));
    });
  }
}

extension UniversityApplicationModelQueryObject on QueryBuilder<
    UniversityApplicationModel, UniversityApplicationModel, QFilterCondition> {
  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> documentsElement(FilterQuery<Attachments> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'documents');
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterFilterCondition> university(FilterQuery<UniversityModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'university');
    });
  }
}

extension UniversityApplicationModelQueryLinks on QueryBuilder<
    UniversityApplicationModel, UniversityApplicationModel, QFilterCondition> {}

extension UniversityApplicationModelQuerySortBy on QueryBuilder<
    UniversityApplicationModel, UniversityApplicationModel, QSortBy> {
  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> sortByBranchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.asc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> sortByBranchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.desc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> sortByCityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cityId', Sort.asc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> sortByCityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cityId', Sort.desc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> sortByComments() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comments', Sort.asc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> sortByCommentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comments', Sort.desc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> sortByDateAdded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateAdded', Sort.asc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> sortByDateAddedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateAdded', Sort.desc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> sortByDateLastModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateLastModified', Sort.asc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> sortByDateLastModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateLastModified', Sort.desc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> sortByOwner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'owner', Sort.asc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> sortByOwnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'owner', Sort.desc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> sortByRegionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionId', Sort.asc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> sortByRegionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionId', Sort.desc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> sortByScholarshipAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scholarshipAmount', Sort.asc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> sortByScholarshipAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scholarshipAmount', Sort.desc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> sortByScholarshipPercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scholarshipPercent', Sort.asc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> sortByScholarshipPercentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scholarshipPercent', Sort.desc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> sortByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.asc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> sortByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.desc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension UniversityApplicationModelQuerySortThenBy on QueryBuilder<
    UniversityApplicationModel, UniversityApplicationModel, QSortThenBy> {
  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> thenByBranchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.asc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> thenByBranchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.desc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> thenByCityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cityId', Sort.asc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> thenByCityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cityId', Sort.desc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> thenByComments() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comments', Sort.asc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> thenByCommentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comments', Sort.desc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> thenByDateAdded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateAdded', Sort.asc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> thenByDateAddedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateAdded', Sort.desc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> thenByDateLastModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateLastModified', Sort.asc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> thenByDateLastModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateLastModified', Sort.desc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> thenByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> thenByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> thenByOwner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'owner', Sort.asc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> thenByOwnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'owner', Sort.desc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> thenByRegionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionId', Sort.asc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> thenByRegionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionId', Sort.desc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> thenByScholarshipAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scholarshipAmount', Sort.asc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> thenByScholarshipAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scholarshipAmount', Sort.desc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> thenByScholarshipPercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scholarshipPercent', Sort.asc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> thenByScholarshipPercentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scholarshipPercent', Sort.desc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> thenByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.asc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> thenByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.desc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension UniversityApplicationModelQueryWhereDistinct on QueryBuilder<
    UniversityApplicationModel, UniversityApplicationModel, QDistinct> {
  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QDistinct> distinctByBranchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'branchId');
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QDistinct> distinctByCityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cityId');
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QDistinct> distinctByComments({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'comments', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QDistinct> distinctByDateAdded({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateAdded', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QDistinct> distinctByDateLastModified({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateLastModified',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QDistinct> distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QDistinct> distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QDistinct> distinctById() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id');
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QDistinct> distinctByOwner() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'owner');
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QDistinct> distinctByRegionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'regionId');
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QDistinct> distinctByScholarshipAmount({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scholarshipAmount',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QDistinct> distinctByScholarshipPercent({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scholarshipPercent',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QDistinct> distinctByState({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'state', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityApplicationModel,
      QDistinct> distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }
}

extension UniversityApplicationModelQueryProperty on QueryBuilder<
    UniversityApplicationModel, UniversityApplicationModel, QQueryProperty> {
  QueryBuilder<UniversityApplicationModel, int, QQueryOperations>
      localIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localId');
    });
  }

  QueryBuilder<UniversityApplicationModel, int?, QQueryOperations>
      branchIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'branchId');
    });
  }

  QueryBuilder<UniversityApplicationModel, int?, QQueryOperations>
      cityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cityId');
    });
  }

  QueryBuilder<UniversityApplicationModel, String?, QQueryOperations>
      commentsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'comments');
    });
  }

  QueryBuilder<UniversityApplicationModel, String?, QQueryOperations>
      dateAddedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateAdded');
    });
  }

  QueryBuilder<UniversityApplicationModel, String?, QQueryOperations>
      dateLastModifiedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateLastModified');
    });
  }

  QueryBuilder<UniversityApplicationModel, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<UniversityApplicationModel, List<Attachments>?, QQueryOperations>
      documentsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'documents');
    });
  }

  QueryBuilder<UniversityApplicationModel, int, QQueryOperations>
      hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<UniversityApplicationModel, int?, QQueryOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UniversityApplicationModel, int?, QQueryOperations>
      ownerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'owner');
    });
  }

  QueryBuilder<UniversityApplicationModel, int?, QQueryOperations>
      regionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'regionId');
    });
  }

  QueryBuilder<UniversityApplicationModel, String?, QQueryOperations>
      scholarshipAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scholarshipAmount');
    });
  }

  QueryBuilder<UniversityApplicationModel, String?, QQueryOperations>
      scholarshipPercentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scholarshipPercent');
    });
  }

  QueryBuilder<UniversityApplicationModel, String?, QQueryOperations>
      stateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'state');
    });
  }

  QueryBuilder<UniversityApplicationModel, String?, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<UniversityApplicationModel, UniversityModel?, QQueryOperations>
      universityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'university');
    });
  }
}
