// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Register _$RegisterFromJson(Map<String, dynamic> json) => Register(
      username: json['username'] as String?,
      password: json['password'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$RegisterToJson(Register instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'email': instance.email,
    };
