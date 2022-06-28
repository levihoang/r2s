class User {
  String? username;
  int? gender;
  String? phone;
  String? email;
  String? avatar;
  String? lastName;
  String? firstName;
  String? status;
  Role? role;

  User(
      {this.username,
      this.gender,
      this.phone,
      this.email,
      this.avatar,
      this.lastName,
      this.firstName,
      this.status,
      this.role});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    gender = json['gender'];
    phone = json['phone'];
    email = json['email'];
    avatar = json['avatar'];
    lastName = json['last_name'];
    firstName = json['first_name'];
    status = json['status'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['gender'] = gender;
    data['phone'] = phone;
    data['email'] = email;
    data['avatar'] = avatar;
    data['last_name'] = lastName;
    data['first_name'] = firstName;
    data['status'] = status;
    if (role != null) {
      data['role'] = role!.toJson();
    }
    return data;
  }
}

class Role {
  int? id;
  String? name;

  Role({this.id, this.name});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
