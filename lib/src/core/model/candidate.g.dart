// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Candidate _$CandidateFromJson(Map<String, dynamic> json) => Candidate(
      id: json['id'] as int?,
      userDTO: json['userDTO'] == null
          ? null
          : User.fromJson(json['userDTO'] as Map<String, dynamic>),
      major: json['major'] == null
          ? null
          : Major.fromJson(json['major'] as Map<String, dynamic>),
      careJobs: (json['careJobs'] as List<dynamic>?)
          ?.map((e) => Job.fromJson(e as Map<String, dynamic>))
          .toList(),
      cv: json['cv'] as String?,
    );

Map<String, dynamic> _$CandidateToJson(Candidate instance) => <String, dynamic>{
      'id': instance.id,
      'userDTO': instance.userDTO,
      'major': instance.major,
      'careJobs': instance.careJobs,
      'cv': instance.cv,
    };
