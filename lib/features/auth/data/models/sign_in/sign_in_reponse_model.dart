import 'package:elmarket/features/auth/data/models/user_model.dart';

class SignInResponseModel {
  String message;
  UserModel user;
  String token;

  SignInResponseModel(
      {required this.message, required this.user, required this.token});

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) {
    return SignInResponseModel(
      message: json['message'],
      user: UserModel.fromJson(json['user']),
      token: json['token'],
    );
  }

  static List<UserModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(UserModel.fromJson).toList();
  }
}
