import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_entities.freezed.dart';
part 'person_entities.g.dart';

@freezed
class PersonEntity with _$PersonEntity {
  const factory PersonEntity({
    required String uid,
    required String name,
    required String email,
  }) = _PersonEntity;

  factory PersonEntity.fromJson(Map<String, dynamic> json) => _$PersonEntityFromJson(json);
}

