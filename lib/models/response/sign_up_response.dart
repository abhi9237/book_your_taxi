import 'package:book_your_taxi/models/common/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'app_error_reponse.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  AppErrorResponse? status;
  UserModel? user;
  String? accessToken;
  String? csrfToken;
  String? message;

  SignUpResponse({
    this.user,
    this.message,
    this.accessToken,
    this.csrfToken,
    this.status,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}
