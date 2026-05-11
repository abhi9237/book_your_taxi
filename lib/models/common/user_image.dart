import 'package:json_annotation/json_annotation.dart';

part 'user_image.g.dart';

@JsonSerializable()
class UserImage {
  String? id;
  String? name;
  String? bucketId;
  String? createdAt;
  String? updatedAt;
  int? size;
  String? url;

  UserImage({
    this.id,
    this.name,
    this.bucketId,
    this.createdAt,
    this.updatedAt,
    this.size,
    this.url,
  });

  factory UserImage.fromJson(Map<String, dynamic> json) =>
      _$UserImageFromJson(json);

  Map<String, dynamic> toJson() => _$UserImageToJson(this);
}

