// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'job_position.g.dart';

@JsonSerializable()
class JobPosition {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;
  JobPosition({
    this.id,
    this.name,
  });

  factory JobPosition.fromJson(Map<String, dynamic> json) =>
      _$JobPositionFromJson(json);

  Map<String, dynamic> toJson() => _$JobPositionToJson(this);
}
