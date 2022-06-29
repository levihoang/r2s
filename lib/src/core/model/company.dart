// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:it_intership_jobs_r2s/src/core/model/status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
class Company {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'logo')
  final String? logo;

  // @JsonKey(name: 'fileLogo')
  // final String? fileLogo;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'website')
  final String? website;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'phone')
  final String? phone;

  @JsonKey(name: 'tax')
  final String? tax;

  @JsonKey(name: 'date')
  final String? date;

  @JsonKey(name: 'status')
  final Status? status;

  Company({
    this.id,
    this.name,
    this.logo,
    this.description,
    this.website,
    this.email,
    this.phone,
    this.tax,
    this.date,
    this.status,
  });

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
