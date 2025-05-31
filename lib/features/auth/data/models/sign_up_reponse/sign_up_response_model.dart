import 'package:elmarket/features/auth/data/models/user_model.dart';

class SignUpResponseModel {
  SignUpResponseModel({
    required this.message,
    required this.user,
    required this.token,
  });
  late final String message;
  late final UserModel user;
  late final String token;

  SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = UserModel.fromJson(json['user']);
    token = json['token'];
  }
  static List<UserModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(UserModel.fromJson).toList();
  }
}
