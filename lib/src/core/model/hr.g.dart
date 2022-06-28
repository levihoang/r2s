// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HR _$HRFromJson(Map<String, dynamic> json) => HR(
      id: json['id'] as int?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      position: json['position'] as String?,
      company: json['company'] == null
          ? null
          : Company.fromJson(json['company'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HRToJson(HR instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'position': instance.position,
      'company': instance.company,
    };
