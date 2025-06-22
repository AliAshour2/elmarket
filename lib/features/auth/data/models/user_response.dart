import 'package:elmarket/features/auth/domain/entities/user_model.dart';

class UserResponse extends UserModel {
  UserResponse({super.name, super.email, super.role});

  UserResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
}
