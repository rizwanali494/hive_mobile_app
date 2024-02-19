// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_post_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAnnouncementPostModelCollection on Isar {
  IsarCollection<AnnouncementPostModel> get announcementPostModels =>
      this.collection();
}

const AnnouncementPostModelSchema = CollectionSchema(
  name: r'AnnouncementPostModel',
  id: -6221271176287981579,
  properties: {
    r'attachments': PropertySchema(
      id: 0,
      name: r'attachments',
      type: IsarType.objectList,
      target: r'Attachments',
    ),
    r'branchId': PropertySchema(
      id: 1,
      name: r'branchId',
      type: IsarType.long,
    ),
    r'dateAdded': PropertySchema(
      id: 2,
      name: r'dateAdded',
      type: IsarType.string,
    ),
    r'dateLastModified': PropertySchema(
      id: 3,
      name: r'dateLastModified',
      type: IsarType.string,
    ),
    r'dislikes': PropertySchema(
      id: 4,
      name: r'dislikes',
      type: IsarType.long,
    ),
    r'event': PropertySchema(
      id: 5,
      name: r'event',
      type: IsarType.object,
      target: r'EventAnnouncementModel',
    ),
    r'expiryDate': PropertySchema(
      id: 6,
      name: r'expiryDate',
      type: IsarType.string,
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
    r'isDisliked': PropertySchema(
      id: 9,
      name: r'isDisliked',
      type: IsarType.bool,
    ),
    r'isLiked': PropertySchema(
      id: 10,
      name: r'isLiked',
      type: IsarType.bool,
    ),
    r'likes': PropertySchema(
      id: 11,
      name: r'likes',
      type: IsarType.long,
    ),
    r'owner': PropertySchema(
      id: 12,
      name: r'owner',
      type: IsarType.object,
      target: r'OwnerModel',
    ),
    r'polls': PropertySchema(
      id: 13,
      name: r'polls',
      type: IsarType.objectList,
      target: r'Polls',
    ),
    r'text': PropertySchema(
      id: 14,
      name: r'text',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 15,
      name: r'type',
      type: IsarType.string,
    )
  },
  estimateSize: _announcementPostModelEstimateSize,
  serialize: _announcementPostModelSerialize,
  deserialize: _announcementPostModelDeserialize,
  deserializeProp: _announcementPostModelDeserializeProp,
  idName: r'localId',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'Polls': PollsSchema,
    r'Attachments': AttachmentsSchema,
    r'OwnerModel': OwnerModelSchema,
    r'AccountPicture': AccountPictureSchema,
    r'AccountDataModel': AccountDataModelSchema,
    r'AccountExtra': AccountExtraSchema,
    r'EventAnnouncementModel': EventAnnouncementModelSchema
  },
  getId: _announcementPostModelGetId,
  getLinks: _announcementPostModelGetLinks,
  attach: _announcementPostModelAttach,
  version: '3.1.0+1',
);

int _announcementPostModelEstimateSize(
  AnnouncementPostModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.attachments;
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
    final value = object.event;
    if (value != null) {
      bytesCount += 3 +
          EventAnnouncementModelSchema.estimateSize(
              value, allOffsets[EventAnnouncementModel]!, allOffsets);
    }
  }
  {
    final value = object.expiryDate;
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
    final list = object.polls;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Polls]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += PollsSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.text;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.type;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _announcementPostModelSerialize(
  AnnouncementPostModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<Attachments>(
    offsets[0],
    allOffsets,
    AttachmentsSchema.serialize,
    object.attachments,
  );
  writer.writeLong(offsets[1], object.branchId);
  writer.writeString(offsets[2], object.dateAdded);
  writer.writeString(offsets[3], object.dateLastModified);
  writer.writeLong(offsets[4], object.dislikes);
  writer.writeObject<EventAnnouncementModel>(
    offsets[5],
    allOffsets,
    EventAnnouncementModelSchema.serialize,
    object.event,
  );
  writer.writeString(offsets[6], object.expiryDate);
  writer.writeLong(offsets[7], object.hashCode);
  writer.writeLong(offsets[8], object.id);
  writer.writeBool(offsets[9], object.isDisliked);
  writer.writeBool(offsets[10], object.isLiked);
  writer.writeLong(offsets[11], object.likes);
  writer.writeObject<OwnerModel>(
    offsets[12],
    allOffsets,
    OwnerModelSchema.serialize,
    object.owner,
  );
  writer.writeObjectList<Polls>(
    offsets[13],
    allOffsets,
    PollsSchema.serialize,
    object.polls,
  );
  writer.writeString(offsets[14], object.text);
  writer.writeString(offsets[15], object.type);
}

AnnouncementPostModel _announcementPostModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AnnouncementPostModel(
    attachments: reader.readObjectList<Attachments>(
      offsets[0],
      AttachmentsSchema.deserialize,
      allOffsets,
      Attachments(),
    ),
    branchId: reader.readLongOrNull(offsets[1]),
    dateAdded: reader.readStringOrNull(offsets[2]),
    dateLastModified: reader.readStringOrNull(offsets[3]),
    dislikes: reader.readLongOrNull(offsets[4]),
    event: reader.readObjectOrNull<EventAnnouncementModel>(
      offsets[5],
      EventAnnouncementModelSchema.deserialize,
      allOffsets,
    ),
    expiryDate: reader.readStringOrNull(offsets[6]),
    id: reader.readLongOrNull(offsets[8]),
    isDisliked: reader.readBoolOrNull(offsets[9]),
    isLiked: reader.readBoolOrNull(offsets[10]),
    likes: reader.readLongOrNull(offsets[11]),
    localId: id,
    owner: reader.readObjectOrNull<OwnerModel>(
      offsets[12],
      OwnerModelSchema.deserialize,
      allOffsets,
    ),
    polls: reader.readObjectList<Polls>(
      offsets[13],
      PollsSchema.deserialize,
      allOffsets,
      Polls(),
    ),
    text: reader.readStringOrNull(offsets[14]),
    type: reader.readStringOrNull(offsets[15]),
  );
  return object;
}

P _announcementPostModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<Attachments>(
        offset,
        AttachmentsSchema.deserialize,
        allOffsets,
        Attachments(),
      )) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readObjectOrNull<EventAnnouncementModel>(
        offset,
        EventAnnouncementModelSchema.deserialize,
        allOffsets,
      )) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readBoolOrNull(offset)) as P;
    case 10:
      return (reader.readBoolOrNull(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    case 12:
      return (reader.readObjectOrNull<OwnerModel>(
        offset,
        OwnerModelSchema.deserialize,
        allOffsets,
      )) as P;
    case 13:
      return (reader.readObjectList<Polls>(
        offset,
        PollsSchema.deserialize,
        allOffsets,
        Polls(),
      )) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _announcementPostModelGetId(AnnouncementPostModel object) {
  return object.localId;
}

List<IsarLinkBase<dynamic>> _announcementPostModelGetLinks(
    AnnouncementPostModel object) {
  return [];
}

void _announcementPostModelAttach(
    IsarCollection<dynamic> col, Id id, AnnouncementPostModel object) {
  object.localId = id;
}

extension AnnouncementPostModelQueryWhereSort
    on QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QWhere> {
  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterWhere>
      anyLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AnnouncementPostModelQueryWhere on QueryBuilder<AnnouncementPostModel,
    AnnouncementPostModel, QWhereClause> {
  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterWhereClause>
      localIdEqualTo(Id localId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: localId,
        upper: localId,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterWhereClause>
      localIdNotEqualTo(Id localId) {
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

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterWhereClause>
      localIdGreaterThan(Id localId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: localId, includeLower: include),
      );
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterWhereClause>
      localIdLessThan(Id localId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: localId, includeUpper: include),
      );
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterWhereClause>
      localIdBetween(
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

extension AnnouncementPostModelQueryFilter on QueryBuilder<
    AnnouncementPostModel, AnnouncementPostModel, QFilterCondition> {
  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> attachmentsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attachments',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> attachmentsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attachments',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> attachmentsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'attachments',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> attachmentsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'attachments',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> attachmentsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'attachments',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> attachmentsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'attachments',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> attachmentsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'attachments',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> attachmentsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'attachments',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> branchIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'branchId',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> branchIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'branchId',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> branchIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'branchId',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
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

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
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

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
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

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> dateAddedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateAdded',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> dateAddedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateAdded',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
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

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
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

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
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

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
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

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
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

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
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

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
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

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
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

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> dateAddedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateAdded',
        value: '',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> dateAddedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dateAdded',
        value: '',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> dateLastModifiedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateLastModified',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> dateLastModifiedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateLastModified',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
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

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
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

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
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

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
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

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
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

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
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

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
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

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
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

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> dateLastModifiedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateLastModified',
        value: '',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> dateLastModifiedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dateLastModified',
        value: '',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> dislikesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dislikes',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> dislikesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dislikes',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> dislikesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dislikes',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> dislikesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dislikes',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> dislikesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dislikes',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> dislikesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dislikes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> eventIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'event',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> eventIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'event',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> expiryDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expiryDate',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> expiryDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expiryDate',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> expiryDateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiryDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> expiryDateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expiryDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> expiryDateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expiryDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> expiryDateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expiryDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> expiryDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'expiryDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> expiryDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'expiryDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
          QAfterFilterCondition>
      expiryDateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'expiryDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
          QAfterFilterCondition>
      expiryDateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'expiryDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> expiryDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiryDate',
        value: '',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> expiryDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'expiryDate',
        value: '',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
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

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
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

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
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

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
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

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
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

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
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

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> isDislikedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isDisliked',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> isDislikedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isDisliked',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> isDislikedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDisliked',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> isLikedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLiked',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> isLikedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLiked',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> isLikedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLiked',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> likesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'likes',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> likesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'likes',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> likesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'likes',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> likesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'likes',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> likesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'likes',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> likesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'likes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> localIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localId',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
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

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
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

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
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

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> ownerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'owner',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> ownerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'owner',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> pollsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'polls',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> pollsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'polls',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> pollsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'polls',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> pollsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'polls',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> pollsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'polls',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> pollsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'polls',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> pollsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'polls',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> pollsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'polls',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> textIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'text',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> textIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'text',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> textEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> textGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> textLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> textBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'text',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> textStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> textEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
          QAfterFilterCondition>
      textContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
          QAfterFilterCondition>
      textMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'text',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> textIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: '',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> textIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'text',
        value: '',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> typeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> typeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> typeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> typeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
          QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
          QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension AnnouncementPostModelQueryObject on QueryBuilder<
    AnnouncementPostModel, AnnouncementPostModel, QFilterCondition> {
  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> attachmentsElement(FilterQuery<Attachments> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'attachments');
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> event(FilterQuery<EventAnnouncementModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'event');
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> owner(FilterQuery<OwnerModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'owner');
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel,
      QAfterFilterCondition> pollsElement(FilterQuery<Polls> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'polls');
    });
  }
}

extension AnnouncementPostModelQueryLinks on QueryBuilder<AnnouncementPostModel,
    AnnouncementPostModel, QFilterCondition> {}

extension AnnouncementPostModelQuerySortBy
    on QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QSortBy> {
  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      sortByBranchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.asc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      sortByBranchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.desc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      sortByDateAdded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateAdded', Sort.asc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      sortByDateAddedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateAdded', Sort.desc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      sortByDateLastModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateLastModified', Sort.asc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      sortByDateLastModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateLastModified', Sort.desc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      sortByDislikes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dislikes', Sort.asc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      sortByDislikesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dislikes', Sort.desc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      sortByExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.asc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      sortByExpiryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.desc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      sortByIsDisliked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDisliked', Sort.asc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      sortByIsDislikedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDisliked', Sort.desc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      sortByIsLiked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLiked', Sort.asc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      sortByIsLikedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLiked', Sort.desc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      sortByLikes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likes', Sort.asc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      sortByLikesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likes', Sort.desc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      sortByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      sortByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension AnnouncementPostModelQuerySortThenBy
    on QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QSortThenBy> {
  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      thenByBranchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.asc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      thenByBranchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.desc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      thenByDateAdded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateAdded', Sort.asc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      thenByDateAddedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateAdded', Sort.desc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      thenByDateLastModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateLastModified', Sort.asc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      thenByDateLastModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateLastModified', Sort.desc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      thenByDislikes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dislikes', Sort.asc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      thenByDislikesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dislikes', Sort.desc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      thenByExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.asc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      thenByExpiryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.desc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      thenByIsDisliked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDisliked', Sort.asc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      thenByIsDislikedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDisliked', Sort.desc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      thenByIsLiked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLiked', Sort.asc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      thenByIsLikedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLiked', Sort.desc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      thenByLikes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likes', Sort.asc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      thenByLikesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likes', Sort.desc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      thenByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      thenByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      thenByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      thenByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension AnnouncementPostModelQueryWhereDistinct
    on QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QDistinct> {
  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QDistinct>
      distinctByBranchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'branchId');
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QDistinct>
      distinctByDateAdded({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateAdded', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QDistinct>
      distinctByDateLastModified({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateLastModified',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QDistinct>
      distinctByDislikes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dislikes');
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QDistinct>
      distinctByExpiryDate({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expiryDate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QDistinct>
      distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QDistinct>
      distinctById() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id');
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QDistinct>
      distinctByIsDisliked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDisliked');
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QDistinct>
      distinctByIsLiked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLiked');
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QDistinct>
      distinctByLikes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'likes');
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QDistinct>
      distinctByText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'text', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AnnouncementPostModel, AnnouncementPostModel, QDistinct>
      distinctByType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension AnnouncementPostModelQueryProperty on QueryBuilder<
    AnnouncementPostModel, AnnouncementPostModel, QQueryProperty> {
  QueryBuilder<AnnouncementPostModel, int, QQueryOperations> localIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localId');
    });
  }

  QueryBuilder<AnnouncementPostModel, List<Attachments>?, QQueryOperations>
      attachmentsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attachments');
    });
  }

  QueryBuilder<AnnouncementPostModel, int?, QQueryOperations>
      branchIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'branchId');
    });
  }

  QueryBuilder<AnnouncementPostModel, String?, QQueryOperations>
      dateAddedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateAdded');
    });
  }

  QueryBuilder<AnnouncementPostModel, String?, QQueryOperations>
      dateLastModifiedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateLastModified');
    });
  }

  QueryBuilder<AnnouncementPostModel, int?, QQueryOperations>
      dislikesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dislikes');
    });
  }

  QueryBuilder<AnnouncementPostModel, EventAnnouncementModel?, QQueryOperations>
      eventProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'event');
    });
  }

  QueryBuilder<AnnouncementPostModel, String?, QQueryOperations>
      expiryDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expiryDate');
    });
  }

  QueryBuilder<AnnouncementPostModel, int, QQueryOperations>
      hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<AnnouncementPostModel, int?, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AnnouncementPostModel, bool?, QQueryOperations>
      isDislikedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDisliked');
    });
  }

  QueryBuilder<AnnouncementPostModel, bool?, QQueryOperations>
      isLikedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLiked');
    });
  }

  QueryBuilder<AnnouncementPostModel, int?, QQueryOperations> likesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'likes');
    });
  }

  QueryBuilder<AnnouncementPostModel, OwnerModel?, QQueryOperations>
      ownerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'owner');
    });
  }

  QueryBuilder<AnnouncementPostModel, List<Polls>?, QQueryOperations>
      pollsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'polls');
    });
  }

  QueryBuilder<AnnouncementPostModel, String?, QQueryOperations>
      textProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'text');
    });
  }

  QueryBuilder<AnnouncementPostModel, String?, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
