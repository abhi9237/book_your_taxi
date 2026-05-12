import 'package:book_your_taxi/models/common/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'app_error_reponse.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  AppErrorResponse? status;
  UserModel? user;
  String? accessToken;
  String? csrfToken;
  String? message;

  LoginResponse({
    this.user,
    this.message,
    this.accessToken,
    this.csrfToken,
    this.status,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
