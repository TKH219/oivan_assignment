import 'package:json_annotation/json_annotation.dart';

part 'sof_user_entity.g.dart';

@JsonSerializable()
class SofUserEntity extends Object {
  @JsonKey(name: 'account_id')
  int accountId;
  @JsonKey(name: 'user_id')
  int userId;
  @JsonKey(name: 'profile_image')
  String profileImage;
  @JsonKey(name: 'display_name')
  String displayName;
  @JsonKey(name: 'location')
  String? location;
  @JsonKey(name: 'reputation')
  int reputation;
  @JsonKey(name: 'age')
  int? age;

  SofUserEntity({
    required this.accountId,
    required this.userId,
    required this.profileImage,
    required this.displayName,
    required this.reputation,
    this.location,
    this.age,
  });

  factory SofUserEntity.fromJson(Map<String, dynamic> json) => _$SofUserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SofUserEntityToJson(this);
}