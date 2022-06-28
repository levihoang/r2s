// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'university.g.dart';

@JsonSerializable()
class University {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'avatar')
  final String? avatar;

  @JsonKey(name: 'shortName')
  final String? shortName;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'website')
  final String? website;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'phone')
  final String? phone;

  @JsonKey(name: 'type')
  final int? type;

  @JsonKey(name: 'createDate')
  final String? createDate;

  @JsonKey(name: 'status')
  final Status? status;
  University({
    this.id,
    this.name,
    this.avatar,
    this.shortName,
    this.description,
    this.website,
    this.email,
    this.phone,
    this.type,
    this.createDate,
    this.status,
  });

  factory University.fromJson(Map<String, dynamic> json) =>
      _$UniversityFromJson(json);

  Map<String, dynamic> toJson() => _$UniversityToJson(this);
}
