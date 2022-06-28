// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

import 'role.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'username')
  final String? username;

  @JsonKey(name: 'gender')
  final int? gender;

  @JsonKey(name: 'phone')
  final String? phone;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'role')
  final Role? role;

  @JsonKey(name: 'firstName')
  final String? firstName;

  @JsonKey(name: 'lastName')
  final String? lastName;

  @JsonKey(name: 'avatar')
  final String? avatar;
  User({
    this.username,
    this.gender,
    this.phone,
    this.email,
    this.role,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  // @JsonKey(name: 'fileAvatar')
  // final String? fileAvatar;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
