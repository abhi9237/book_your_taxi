// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: json['id'] as String?,
  email: json['email'] as String?,
  emailVerified: json['emailVerified'] as bool?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  providers: (json['providers'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  type: json['type'] as String?,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'emailVerified': instance.emailVerified,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'type': instance.type,
  'providers': instance.providers,
};
