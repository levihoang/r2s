// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'country.dart';

part 'province.g.dart';

@JsonSerializable()
class Province {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'shortName')
  final String? shortName;

  @JsonKey(name: 'countries')
  final Country? countries;
  Province({
    this.id,
    this.name,
    this.shortName,
    this.countries,
  });

  factory Province.fromJson(Map<String, dynamic> json) =>
      _$ProvinceFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceToJson(this);
}
