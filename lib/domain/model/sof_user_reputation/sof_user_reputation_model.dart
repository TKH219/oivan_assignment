import 'package:json_annotation/json_annotation.dart';
import '../../../data/entities/entity.dart';

part 'sof_user_reputation_model.g.dart';

@JsonSerializable()
class SofUserReputationModel extends Object {
  String reputationHistoryType;
  int reputationChange;
  DateTime creationDate;
  int postId;
  int userId;

  SofUserReputationModel({
    required this.reputationHistoryType,
    required this.reputationChange,
    required this.postId,
    required this.creationDate,
    required this.userId,
  });

  factory SofUserReputationModel.fromJson(Map<String, dynamic> json) => _$SofUserReputationModelFromJson(json);

  Map<String, dynamic> toJson() => _$SofUserReputationModelToJson(this);

  factory SofUserReputationModel.fromEntity(SofUserReputationEntity entity) {
    return SofUserReputationModel(
      creationDate: entity.creationDateTime,
      postId: entity.postId,
      reputationChange: entity.reputationChange,
      reputationHistoryType: entity.reputationHistoryType,
      userId: entity.userId,
    );
  }
}
