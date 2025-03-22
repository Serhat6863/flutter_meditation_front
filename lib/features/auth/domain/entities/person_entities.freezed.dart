// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PersonEntity _$PersonEntityFromJson(Map<String, dynamic> json) {
  return _PersonEntity.fromJson(json);
}

/// @nodoc
mixin _$PersonEntity {
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  /// Serializes this PersonEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PersonEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonEntityCopyWith<PersonEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonEntityCopyWith<$Res> {
  factory $PersonEntityCopyWith(
          PersonEntity value, $Res Function(PersonEntity) then) =
      _$PersonEntityCopyWithImpl<$Res, PersonEntity>;
  @useResult
  $Res call({String uid, String name, String email});
}

/// @nodoc
class _$PersonEntityCopyWithImpl<$Res, $Val extends PersonEntity>
    implements $PersonEntityCopyWith<$Res> {
  _$PersonEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PersonEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonEntityImplCopyWith<$Res>
    implements $PersonEntityCopyWith<$Res> {
  factory _$$PersonEntityImplCopyWith(
          _$PersonEntityImpl value, $Res Function(_$PersonEntityImpl) then) =
      __$$PersonEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, String name, String email});
}

/// @nodoc
class __$$PersonEntityImplCopyWithImpl<$Res>
    extends _$PersonEntityCopyWithImpl<$Res, _$PersonEntityImpl>
    implements _$$PersonEntityImplCopyWith<$Res> {
  __$$PersonEntityImplCopyWithImpl(
      _$PersonEntityImpl _value, $Res Function(_$PersonEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of PersonEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_$PersonEntityImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonEntityImpl implements _PersonEntity {
  const _$PersonEntityImpl(
      {required this.uid, required this.name, required this.email});

  factory _$PersonEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonEntityImplFromJson(json);

  @override
  final String uid;
  @override
  final String name;
  @override
  final String email;

  @override
  String toString() {
    return 'PersonEntity(uid: $uid, name: $name, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonEntityImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uid, name, email);

  /// Create a copy of PersonEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonEntityImplCopyWith<_$PersonEntityImpl> get copyWith =>
      __$$PersonEntityImplCopyWithImpl<_$PersonEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonEntityImplToJson(
      this,
    );
  }
}

abstract class _PersonEntity implements PersonEntity {
  const factory _PersonEntity(
      {required final String uid,
      required final String name,
      required final String email}) = _$PersonEntityImpl;

  factory _PersonEntity.fromJson(Map<String, dynamic> json) =
      _$PersonEntityImpl.fromJson;

  @override
  String get uid;
  @override
  String get name;
  @override
  String get email;

  /// Create a copy of PersonEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonEntityImplCopyWith<_$PersonEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
