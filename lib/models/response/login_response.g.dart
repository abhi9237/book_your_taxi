// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      message: json['message'] as String?,
      accessToken: json['accessToken'] as String?,
      csrfToken: json['csrfToken'] as String?,
      status: json['status'] == null
          ? null
          : AppErrorResponse.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'user': instance.user,
      'accessToken': instance.accessToken,
      'csrfToken': instance.csrfToken,
      'message': instance.message,
    };
