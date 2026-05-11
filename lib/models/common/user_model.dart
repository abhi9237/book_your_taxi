import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? id;
  String? email;
  bool? emailVerified;
  String? createdAt;
  String? updatedAt;
  String? type;
  String? profileImage;
  String? gender;
  String? phoneNumber;
  String? name;
  List<String>? providers;

  UserModel({
    this.id,
    this.email,
    this.emailVerified,
    this.createdAt,
    this.updatedAt,
    this.providers,
    this.type,
    this.name,
    this.profileImage,
    this.gender,
    this.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
