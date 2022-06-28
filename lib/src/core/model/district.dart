import 'package:json_annotation/json_annotation.dart';

import 'province.dart';

part 'district.g.dart';

@JsonSerializable()
class District {
  District({
    this.id,
    this.name,
    this.prefix,
    this.province,
  });
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'prefix')
  final String? prefix;

  @JsonKey(name: 'province')
  final Province? province;

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictToJson(this);
}
