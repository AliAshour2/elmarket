import 'package:elmarket/features/auth/data/models/user_response.dart';
import 'package:elmarket/features/auth/domain/entities/user_model.dart';

extension UserMapper on UserResponse {
  UserModel userResponseToUserModel() => UserModel(
        name: name,
        email: email,
        role: role,
      );
}
