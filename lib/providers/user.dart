class UserData {
  String? id;
  String? email;
  String? name;
  String? password;
  String? confirmPassword;

  UserData({
    this.id,
    this.email,
    this.name,
    this.password,
    this.confirmPassword,
  });

  UserData.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['password'] = password;
    map['confirmPassword'] = confirmPassword;
    map['name'] = name;
    return map;
  }
}
