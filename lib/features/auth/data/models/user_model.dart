class UserModel {
  String? name;
  String? email;
  String? role;

  UserModel({this.name, this.email, this.role});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
}
