import 'dart:convert';

class User {
  final String username;
  // final int gender;
  // final String avatar;
  // final String phone;
  // final String firstname;
  // final String lastname;
  final String email;
  // final String status;
  // final String role;
  // final int id;
  // final String name;
  // final String fileAvatar;
  final String password;
  final String confirmPassword;

  const User({
    required this.username,
    // required this.gender,
    // required this.avatar,
    // required this.phone,
    // required this.firstname,
    // required this.lastname,
    required this.email,
    // required this.status,
    // required this.role,
    // required this.name,
    // required this.fileAvatar,
    required this.password,
    required this.confirmPassword,
    // required this.id
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        username: json['username'],
        // gender: json['gender'],
        // avatar: json['avatar'],
        // phone: json['phone'],
        // firstname: json['firstname'],
        // lastname: json['lastname'],
        email: json['email'],
        // status: json['status'],
        // role: ({
        //   name: json['name'],
        //   id: json['id']);
        // }),

        // fileAvatar: json['fileAvatar'],
        password: json['password'],
        confirmPassword: json['confirmPassword']);
  }
}
