class User {
  final String username;
  final int? gender;
  final String? phone;
  final String? email;
  final String? status;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  User(this.username, this.gender, this.phone, this.email, this.status,
      this.firstName, this.lastName, this.avatar);

  Map<String, dynamic> toJson() => {
        'username': username,
        'gender': gender,
        'phone': phone,
        'email': email,
        'status': status,
        'firstName': firstName,
        'lastName': lastName,
        'avatar': avatar,
      };

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['username'],
      json['gender'],
      json['phone'],
      json['email'],
      json['status'],
      json['firstName'],
      json['lastName'],
      json['avatar'],
    );
  }
}
