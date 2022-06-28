// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'company.dart';
import 'district.dart';
import 'job.dart';
import 'university.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'district')
  final District? district;

  @JsonKey(name: 'address')
  final String? address;

  @JsonKey(name: 'note')
  final String? note;

  @JsonKey(name: 'companies')
  final List<Company>? companies;

  @JsonKey(name: 'universities')
  final List<University>? universities;

  @JsonKey(name: 'jobs')
  final List<Job>? jobs;
  Location({
    this.id,
    this.district,
    this.address,
    this.note,
    this.companies,
    this.universities,
    this.jobs,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
