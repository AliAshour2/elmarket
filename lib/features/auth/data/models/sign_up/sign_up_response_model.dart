import 'package:elmarket/features/auth/data/models/user_response.dart';

class SignUpResponseModel {
  String message;
  UserResponse user;
  String token;

  SignUpResponseModel({
    required this.message,
    required this.user,
    required this.token,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    return SignUpResponseModel(
      message: json['message'],
      user: UserResponse.fromJson(json['user']),
      token: json['token'],
    );
  }

  static List<UserResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(UserResponse.fromJson).toList();
  }
}
