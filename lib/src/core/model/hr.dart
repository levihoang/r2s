// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'company.dart';
import 'user.dart';

part 'hr.g.dart';

@JsonSerializable()
class HR {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'user')
  final User? user;

  @JsonKey(name: 'position')
  final String? position;

  @JsonKey(name: 'company')
  final Company? company;
  HR({
    this.id,
    this.user,
    this.position,
    this.company,
  });

  factory HR.fromJson(Map<String, dynamic> json) => _$HRFromJson(json);

  Map<String, dynamic> toJson() => _$HRToJson(this);
}
