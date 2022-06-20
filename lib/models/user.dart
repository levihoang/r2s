class User {
  final String username;
  final int? gender;
  final String? avatar;
  final String? phone;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? status;
  final String? cv;
  final String? major;
  final Map<String, dynamic>? role;

  User(this.username, this.gender, this.avatar, this.phone, this.firstName,
      this.lastName, this.email, this.status, this.cv, this.major, this.role);

  Map<String, dynamic> toJson() => {
        'username': username,
        'gender': gender,
        'avatar': avatar,
        'phone': phone,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'status': status,
        'cv': cv,
        'major': major,
        'role': {
          // default candidate
          'id': 1,
        }
      };

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['username'],
      json['gender'],
      json['avatar'],
      json['phone'],
      json['firstName'],
      json['lastName'],
      json['email'],
      json['status'],
      json['cv'],
      json['major'],
      json['role'],
    );
  }
}
