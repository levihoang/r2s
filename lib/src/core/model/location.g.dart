// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      id: json['id'] as int?,
      district: json['district'] == null
          ? null
          : District.fromJson(json['district'] as Map<String, dynamic>),
      address: json['address'] as String?,
      note: json['note'] as String?,
      companies: (json['companies'] as List<dynamic>?)
          ?.map((e) => Company.fromJson(e as Map<String, dynamic>))
          .toList(),
      universities: (json['universities'] as List<dynamic>?)
          ?.map((e) => University.fromJson(e as Map<String, dynamic>))
          .toList(),
      jobs: (json['jobs'] as List<dynamic>?)
          ?.map((e) => Job.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'id': instance.id,
      'district': instance.district,
      'address': instance.address,
      'note': instance.note,
      'companies': instance.companies,
      'universities': instance.universities,
      'jobs': instance.jobs,
    };
