import 'package:json_annotation/json_annotation.dart';

import '../../model/role.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  RegisterRequest(
      {this.username,
      this.password,
      this.confirmPassword,
      this.role,
      this.email});
  @JsonKey(name: 'username')
  final String? username;

  @JsonKey(name: 'password')
  final String? password;

  @JsonKey(name: 'confirmPassword')
  final String? confirmPassword;

  @JsonKey(name: 'role')
  Role? role = Role(id: 3);

  @JsonKey(name: 'email')
  final String? email;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
