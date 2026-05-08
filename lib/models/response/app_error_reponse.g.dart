// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_error_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppErrorResponse _$AppErrorResponseFromJson(Map<String, dynamic> json) =>
    AppErrorResponse(
      error: json['error'] as String?,
      message: json['message'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AppErrorResponseToJson(AppErrorResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'statusCode': instance.statusCode,
    };
