import 'package:json_annotation/json_annotation.dart';

part 'app_error_reponse.g.dart';

@JsonSerializable()
class AppErrorResponse {
  String? error;
  String? message;
  int? statusCode;

  AppErrorResponse({this.error, this.message, this.statusCode});

  factory AppErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$AppErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AppErrorResponseToJson(this);
}
