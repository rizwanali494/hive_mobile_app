// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNotificationModelCollection on Isar {
  IsarCollection<NotificationModel> get notificationModels => this.collection();
}

const NotificationModelSchema = CollectionSchema(
  name: r'NotificationModel',
  id: 1422516433030028244,
  properties: {
    r'attachedObjectId': PropertySchema(
      id: 0,
      name: r'attachedObjectId',
      type: IsarType.long,
    ),
    r'attachedObjectType': PropertySchema(
      id: 1,
      name: r'attachedObjectType',
      type: IsarType.string,
    ),
    r'attachments': PropertySchema(
      id: 2,
      name: r'attachments',
      type: IsarType.objectList,
      target: r'Attachments',
    ),
    r'content': PropertySchema(
      id: 3,
      name: r'content',
      type: IsarType.string,
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
    r'hashCode': PropertySchema(
      id: 6,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'id': PropertySchema(
      id: 7,
      name: r'id',
      type: IsarType.long,
    ),
    r'isRead': PropertySchema(
      id: 8,
      name: r'isRead',
      type: IsarType.bool,
    ),
    r'recipient': PropertySchema(
      id: 9,
      name: r'recipient',
      type: IsarType.long,
    )
  },
  estimateSize: _notificationModelEstimateSize,
  serialize: _notificationModelSerialize,
  deserialize: _notificationModelDeserialize,
  deserializeProp: _notificationModelDeserializeProp,
  idName: r'localId',
  indexes: {},
  links: {},
  embeddedSchemas: {r'Attachments': AttachmentsSchema},
  getId: _notificationModelGetId,
  getLinks: _notificationModelGetLinks,
  attach: _notificationModelAttach,
  version: '3.1.0+1',
);

int _notificationModelEstimateSize(
  NotificationModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.attachedObjectType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
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
    final value = object.content;
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
  return bytesCount;
}

void _notificationModelSerialize(
  NotificationModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.attachedObjectId);
  writer.writeString(offsets[1], object.attachedObjectType);
  writer.writeObjectList<Attachments>(
    offsets[2],
    allOffsets,
    AttachmentsSchema.serialize,
    object.attachments,
  );
  writer.writeString(offsets[3], object.content);
  writer.writeString(offsets[4], object.dateAdded);
  writer.writeString(offsets[5], object.dateLastModified);
  writer.writeLong(offsets[6], object.hashCode);
  writer.writeLong(offsets[7], object.id);
  writer.writeBool(offsets[8], object.isRead);
  writer.writeLong(offsets[9], object.recipient);
}

NotificationModel _notificationModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NotificationModel(
    attachedObjectId: reader.readLongOrNull(offsets[0]),
    attachedObjectType: reader.readStringOrNull(offsets[1]),
    attachments: reader.readObjectList<Attachments>(
      offsets[2],
      AttachmentsSchema.deserialize,
      allOffsets,
      Attachments(),
    ),
    content: reader.readStringOrNull(offsets[3]),
    dateAdded: reader.readStringOrNull(offsets[4]),
    dateLastModified: reader.readStringOrNull(offsets[5]),
    id: reader.readLongOrNull(offsets[7]),
    isRead: reader.readBoolOrNull(offsets[8]),
    localId: id,
    recipient: reader.readLongOrNull(offsets[9]),
  );
  return object;
}

P _notificationModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readObjectList<Attachments>(
        offset,
        AttachmentsSchema.deserialize,
        allOffsets,
        Attachments(),
      )) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readBoolOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _notificationModelGetId(NotificationModel object) {
  return object.localId;
}

List<IsarLinkBase<dynamic>> _notificationModelGetLinks(
    NotificationModel object) {
  return [];
}

void _notificationModelAttach(
    IsarCollection<dynamic> col, Id id, NotificationModel object) {
  object.localId = id;
}

extension NotificationModelQueryWhereSort
    on QueryBuilder<NotificationModel, NotificationModel, QWhere> {
  QueryBuilder<NotificationModel, NotificationModel, QAfterWhere> anyLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NotificationModelQueryWhere
    on QueryBuilder<NotificationModel, NotificationModel, QWhereClause> {
  QueryBuilder<NotificationModel, NotificationModel, QAfterWhereClause>
      localIdEqualTo(Id localId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: localId,
        upper: localId,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterWhereClause>
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterWhereClause>
      localIdGreaterThan(Id localId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: localId, includeLower: include),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterWhereClause>
      localIdLessThan(Id localId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: localId, includeUpper: include),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterWhereClause>
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

extension NotificationModelQueryFilter
    on QueryBuilder<NotificationModel, NotificationModel, QFilterCondition> {
  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      attachedObjectIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attachedObjectId',
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      attachedObjectIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attachedObjectId',
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      attachedObjectIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachedObjectId',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      attachedObjectIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'attachedObjectId',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      attachedObjectIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'attachedObjectId',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      attachedObjectIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'attachedObjectId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      attachedObjectTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attachedObjectType',
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      attachedObjectTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attachedObjectType',
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      attachedObjectTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachedObjectType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      attachedObjectTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'attachedObjectType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      attachedObjectTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'attachedObjectType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      attachedObjectTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'attachedObjectType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      attachedObjectTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'attachedObjectType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      attachedObjectTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'attachedObjectType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      attachedObjectTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'attachedObjectType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      attachedObjectTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'attachedObjectType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      attachedObjectTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachedObjectType',
        value: '',
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      attachedObjectTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'attachedObjectType',
        value: '',
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      attachmentsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attachments',
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      attachmentsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attachments',
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      attachmentsLengthEqualTo(int length) {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      attachmentsIsEmpty() {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      attachmentsIsNotEmpty() {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      attachmentsLengthLessThan(
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      attachmentsLengthGreaterThan(
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      attachmentsLengthBetween(
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      contentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'content',
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      contentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'content',
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      contentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      contentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      contentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      contentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'content',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      contentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      contentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      contentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      contentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'content',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      contentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      contentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      dateAddedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateAdded',
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      dateAddedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateAdded',
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      dateAddedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dateAdded',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      dateAddedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dateAdded',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      dateAddedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateAdded',
        value: '',
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      dateAddedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dateAdded',
        value: '',
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      dateLastModifiedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateLastModified',
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      dateLastModifiedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateLastModified',
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      dateLastModifiedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dateLastModified',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      dateLastModifiedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dateLastModified',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      dateLastModifiedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateLastModified',
        value: '',
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      dateLastModifiedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dateLastModified',
        value: '',
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      hashCodeGreaterThan(
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      hashCodeLessThan(
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      hashCodeBetween(
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      isReadIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isRead',
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      isReadIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isRead',
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      isReadEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isRead',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      localIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localId',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      localIdGreaterThan(
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      localIdLessThan(
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      localIdBetween(
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      recipientIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'recipient',
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      recipientIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'recipient',
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      recipientEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recipient',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      recipientGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recipient',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      recipientLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recipient',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      recipientBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recipient',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NotificationModelQueryObject
    on QueryBuilder<NotificationModel, NotificationModel, QFilterCondition> {
  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
      attachmentsElement(FilterQuery<Attachments> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'attachments');
    });
  }
}

extension NotificationModelQueryLinks
    on QueryBuilder<NotificationModel, NotificationModel, QFilterCondition> {}

extension NotificationModelQuerySortBy
    on QueryBuilder<NotificationModel, NotificationModel, QSortBy> {
  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      sortByAttachedObjectId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachedObjectId', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      sortByAttachedObjectIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachedObjectId', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      sortByAttachedObjectType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachedObjectType', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      sortByAttachedObjectTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachedObjectType', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      sortByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      sortByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      sortByDateAdded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateAdded', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      sortByDateAddedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateAdded', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      sortByDateLastModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateLastModified', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      sortByDateLastModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateLastModified', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      sortByIsRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRead', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      sortByIsReadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRead', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      sortByRecipient() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recipient', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      sortByRecipientDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recipient', Sort.desc);
    });
  }
}

extension NotificationModelQuerySortThenBy
    on QueryBuilder<NotificationModel, NotificationModel, QSortThenBy> {
  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      thenByAttachedObjectId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachedObjectId', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      thenByAttachedObjectIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachedObjectId', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      thenByAttachedObjectType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachedObjectType', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      thenByAttachedObjectTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachedObjectType', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      thenByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      thenByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      thenByDateAdded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateAdded', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      thenByDateAddedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateAdded', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      thenByDateLastModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateLastModified', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      thenByDateLastModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateLastModified', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      thenByIsRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRead', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      thenByIsReadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRead', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      thenByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      thenByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      thenByRecipient() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recipient', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
      thenByRecipientDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recipient', Sort.desc);
    });
  }
}

extension NotificationModelQueryWhereDistinct
    on QueryBuilder<NotificationModel, NotificationModel, QDistinct> {
  QueryBuilder<NotificationModel, NotificationModel, QDistinct>
      distinctByAttachedObjectId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attachedObjectId');
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QDistinct>
      distinctByAttachedObjectType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attachedObjectType',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QDistinct>
      distinctByContent({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'content', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QDistinct>
      distinctByDateAdded({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateAdded', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QDistinct>
      distinctByDateLastModified({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateLastModified',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QDistinct>
      distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QDistinct> distinctById() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id');
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QDistinct>
      distinctByIsRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isRead');
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QDistinct>
      distinctByRecipient() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recipient');
    });
  }
}

extension NotificationModelQueryProperty
    on QueryBuilder<NotificationModel, NotificationModel, QQueryProperty> {
  QueryBuilder<NotificationModel, int, QQueryOperations> localIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localId');
    });
  }

  QueryBuilder<NotificationModel, int?, QQueryOperations>
      attachedObjectIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attachedObjectId');
    });
  }

  QueryBuilder<NotificationModel, String?, QQueryOperations>
      attachedObjectTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attachedObjectType');
    });
  }

  QueryBuilder<NotificationModel, List<Attachments>?, QQueryOperations>
      attachmentsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attachments');
    });
  }

  QueryBuilder<NotificationModel, String?, QQueryOperations> contentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'content');
    });
  }

  QueryBuilder<NotificationModel, String?, QQueryOperations>
      dateAddedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateAdded');
    });
  }

  QueryBuilder<NotificationModel, String?, QQueryOperations>
      dateLastModifiedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateLastModified');
    });
  }

  QueryBuilder<NotificationModel, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<NotificationModel, int?, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NotificationModel, bool?, QQueryOperations> isReadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isRead');
    });
  }

  QueryBuilder<NotificationModel, int?, QQueryOperations> recipientProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recipient');
    });
  }
}
