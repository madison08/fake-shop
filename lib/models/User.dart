class User {
  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;

  User({this.id, this.email, this.password, this.name, this.role, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    role = json['role'];
    avatar = json['avatar'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['email'] = this.email;
  //   data['password'] = this.password;
  //   data['name'] = this.name;
  //   data['role'] = this.role;
  //   data['avatar'] = this.avatar;
  //   return data;
  // }
}
