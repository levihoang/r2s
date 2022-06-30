// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  @JsonKey(name: 'Username')
  final String? username;

  @JsonKey(name: 'Email')
  final String? email;

  @JsonKey(name: 'path')
  final String? path;
  RegisterResponse({
    this.username,
    this.email,
    this.path,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}
