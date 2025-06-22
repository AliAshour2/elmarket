import 'package:elmarket/features/auth/data/models/user_response.dart';

class SignInResponseModel {
  String message;
  UserResponse user;
  String token;

  SignInResponseModel(
      {required this.message, required this.user, required this.token});

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) {
    return SignInResponseModel(
      message: json['message'],
      user: UserResponse.fromJson(json['user']),
      token: json['token'],
    );
  }

  static List<UserResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(UserResponse.fromJson).toList();
  }
}
