// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner_model.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const OwnerModelSchema = Schema(
  name: r'OwnerModel',
  id: 767320537195107714,
  properties: {
    r'accountData': PropertySchema(
      id: 0,
      name: r'accountData',
      type: IsarType.object,
      target: r'AccountDataModel',
    ),
    r'accountType': PropertySchema(
      id: 1,
      name: r'accountType',
      type: IsarType.string,
    ),
    r'dateJoined': PropertySchema(
      id: 2,
      name: r'dateJoined',
      type: IsarType.string,
    ),
    r'email': PropertySchema(
      id: 3,
      name: r'email',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 4,
      name: r'id',
      type: IsarType.long,
    ),
    r'isActive': PropertySchema(
      id: 5,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'picture': PropertySchema(
      id: 6,
      name: r'picture',
      type: IsarType.object,
      target: r'AccountPicture',
    )
  },
  estimateSize: _ownerModelEstimateSize,
  serialize: _ownerModelSerialize,
  deserialize: _ownerModelDeserialize,
  deserializeProp: _ownerModelDeserializeProp,
);

int _ownerModelEstimateSize(
  OwnerModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.accountData;
    if (value != null) {
      bytesCount += 3 +
          AccountDataModelSchema.estimateSize(
              value, allOffsets[AccountDataModel]!, allOffsets);
    }
  }
  {
    final value = object.accountType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.dateJoined;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.email;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.picture;
    if (value != null) {
      bytesCount += 3 +
          AccountPictureSchema.estimateSize(
              value, allOffsets[AccountPicture]!, allOffsets);
    }
  }
  return bytesCount;
}

void _ownerModelSerialize(
  OwnerModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<AccountDataModel>(
    offsets[0],
    allOffsets,
    AccountDataModelSchema.serialize,
    object.accountData,
  );
  writer.writeString(offsets[1], object.accountType);
  writer.writeString(offsets[2], object.dateJoined);
  writer.writeString(offsets[3], object.email);
  writer.writeLong(offsets[4], object.id);
  writer.writeBool(offsets[5], object.isActive);
  writer.writeObject<AccountPicture>(
    offsets[6],
    allOffsets,
    AccountPictureSchema.serialize,
    object.picture,
  );
}

OwnerModel _ownerModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OwnerModel(
    accountData: reader.readObjectOrNull<AccountDataModel>(
      offsets[0],
      AccountDataModelSchema.deserialize,
      allOffsets,
    ),
    accountType: reader.readStringOrNull(offsets[1]),
    dateJoined: reader.readStringOrNull(offsets[2]),
    email: reader.readStringOrNull(offsets[3]),
    id: reader.readLongOrNull(offsets[4]),
    isActive: reader.readBoolOrNull(offsets[5]),
    picture: reader.readObjectOrNull<AccountPicture>(
      offsets[6],
      AccountPictureSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _ownerModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<AccountDataModel>(
        offset,
        AccountDataModelSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readBoolOrNull(offset)) as P;
    case 6:
      return (reader.readObjectOrNull<AccountPicture>(
        offset,
        AccountPictureSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension OwnerModelQueryFilter
    on QueryBuilder<OwnerModel, OwnerModel, QFilterCondition> {
  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition>
      accountDataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'accountData',
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition>
      accountDataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'accountData',
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition>
      accountTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'accountType',
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition>
      accountTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'accountType',
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition>
      accountTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition>
      accountTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accountType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition>
      accountTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accountType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition>
      accountTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accountType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition>
      accountTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'accountType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition>
      accountTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'accountType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition>
      accountTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accountType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition>
      accountTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accountType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition>
      accountTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountType',
        value: '',
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition>
      accountTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accountType',
        value: '',
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition>
      dateJoinedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateJoined',
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition>
      dateJoinedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateJoined',
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition> dateJoinedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateJoined',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition>
      dateJoinedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateJoined',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition>
      dateJoinedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateJoined',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition> dateJoinedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateJoined',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition>
      dateJoinedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dateJoined',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition>
      dateJoinedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dateJoined',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition>
      dateJoinedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dateJoined',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition> dateJoinedMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dateJoined',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition>
      dateJoinedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateJoined',
        value: '',
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition>
      dateJoinedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dateJoined',
        value: '',
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition> emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition> emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition> emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition> emailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition> emailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition> emailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition> emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition> emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition> emailContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition> emailMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition> emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition>
      emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition> idEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition> isActiveEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition> pictureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'picture',
      ));
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition>
      pictureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'picture',
      ));
    });
  }
}

extension OwnerModelQueryObject
    on QueryBuilder<OwnerModel, OwnerModel, QFilterCondition> {
  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition> accountData(
      FilterQuery<AccountDataModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'accountData');
    });
  }

  QueryBuilder<OwnerModel, OwnerModel, QAfterFilterCondition> picture(
      FilterQuery<AccountPicture> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'picture');
    });
  }
}
