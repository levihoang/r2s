// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Job _$JobFromJson(Map<String, dynamic> json) => Job(
      id: json['id'] as int?,
      hr: json['hr'] == null
          ? null
          : HR.fromJson(json['hr'] as Map<String, dynamic>),
      description: json['desciption'] as String?,
      major: json['major'] == null
          ? null
          : Major.fromJson(json['major'] as Map<String, dynamic>),
      jobposition: json['jobposition'] == null
          ? null
          : JobPosition.fromJson(json['jobposition'] as Map<String, dynamic>),
      amount: json['amount'] as int?,
      salaryMin: json['salaryMin'] as int?,
      salaryMax: json['salaryMax'] as int?,
      requirement: json['requirement'] as String?,
      otherInfo: json['otherInfo'] as String?,
      timeStartStr: json['timeStartStr'] as String?,
      timeEndStr: json['timeEndStr'] as String?,
      locationjob: json['locationjob'] == null
          ? null
          : Location.fromJson(json['locationjob'] as Map<String, dynamic>),
      createDate: json['createDate'] as String?,
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      applyDTO: (json['applyDTO'] as List<dynamic>?)
          ?.map((e) => Job.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
      'id': instance.id,
      'hr': instance.hr,
      'desciption': instance.description,
      'major': instance.major,
      'jobposition': instance.jobposition,
      'amount': instance.amount,
      'salaryMin': instance.salaryMin,
      'salaryMax': instance.salaryMax,
      'requirement': instance.requirement,
      'otherInfo': instance.otherInfo,
      'timeStartStr': instance.timeStartStr,
      'timeEndStr': instance.timeEndStr,
      'locationjob': instance.locationjob,
      'createDate': instance.createDate,
      'status': instance.status,
      'applyDTO': instance.applyDTO,
    };
