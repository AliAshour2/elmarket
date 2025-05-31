import 'package:elmarket/features/auth/data/models/user_model.dart';

class SignInResponseModel {
  String? message;
  UserModel? user;
  String? token;

  SignInResponseModel({this.message, this.user, this.token});

  SignInResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['message'] is String) {
      message = json['message'];
    }
    if (json['user'] is Map) {
      user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    }
    if (json['token'] is String) {
      token = json['token'];
    }
  }

  static List<UserModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(UserModel.fromJson).toList();
  }
}
