import 'package:json_annotation/json_annotation.dart';
import '../../../data/entities/entity.dart';

part 'sof_user_model.g.dart';

@JsonSerializable()
class SofUserModel extends Object {
  int accountId;
  int userId;
  String profileImage;
  String displayName;
  int reputation;
  String? location;
  int? age;

  SofUserModel({
    required this.accountId,
    required this.userId,
    required this.profileImage,
    required this.displayName,
    required this.reputation,
    this.location,
    this.age,
  });

  factory SofUserModel.fromJson(Map<String, dynamic> json) => _$SofUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$SofUserModelToJson(this);

  factory SofUserModel.fromEntity(SofUserEntity entity) {
    return SofUserModel(
      accountId: entity.accountId,
      userId: entity.userId,
      location: entity.location,
      profileImage: entity.profileImage,
      displayName: entity.displayName,
      reputation: entity.reputation,
      age: entity.age,
    );
  }
}
