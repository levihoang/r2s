// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      Username: json['Username'] as String?,
      Email: json['Email'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'Username': instance.Username,
      'Email': instance.Email,
      'username': instance.username,
      'email': instance.email,
      'path': instance.path,
    };
