class User {
  final String username;
  final int? gender;
  final String? avatar;
  final String? phone;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? status;
  final Map<String, dynamic>? role;

  User(this.username, this.gender, this.avatar, this.phone, this.firstName,
      this.lastName, this.email, this.status, this.role);

  Map<String, dynamic> toJson() => {
        'username': username,
        'gender': gender,
        'avatar': avatar,
        'phone': phone,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'status': status,
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
        json['role']);
  }

  // static User fromSnap(DocumentSnapshot snap) {
  //   var snapShot = snap.data() as Map<String, dynamic>;

  //   return User(
  //       username: snapShot['username'],
  //       uid: snapShot['uid'],
  //       email: snapShot['email'],
  //       bio: snapShot['bio'],
  //       followers: snapShot['followers'],
  //       following: snapShot['following'],
  //       photoUrl: snapShot['photoUrl']);
  // }
}
