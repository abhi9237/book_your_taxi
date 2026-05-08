// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) =>
    SignUpResponse(
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

Map<String, dynamic> _$SignUpResponseToJson(SignUpResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'user': instance.user,
      'accessToken': instance.accessToken,
      'csrfToken': instance.csrfToken,
      'message': instance.message,
    };
