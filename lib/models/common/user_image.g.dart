// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserImage _$UserImageFromJson(Map<String, dynamic> json) => UserImage(
  id: json['id'] as String?,
  name: json['name'] as String?,
  bucketId: json['bucketId'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  size: (json['size'] as num?)?.toInt(),
  url: json['url'] as String?,
);

Map<String, dynamic> _$UserImageToJson(UserImage instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'bucketId': instance.bucketId,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'size': instance.size,
  'url': instance.url,
};
