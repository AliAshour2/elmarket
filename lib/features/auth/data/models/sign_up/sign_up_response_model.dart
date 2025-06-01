import 'package:elmarket/features/auth/data/models/user_model.dart';

class SignUpResponseModel {
  String message;
  UserModel user;
  String token;

  SignUpResponseModel({
    required this.message,
    required this.user,
    required this.token,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    return SignUpResponseModel(
      message: json['message'],
      user: UserModel.fromJson(json['user']),
      token: json['token'],
    );
  }

  static List<UserModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(UserModel.fromJson).toList();
  }
}
