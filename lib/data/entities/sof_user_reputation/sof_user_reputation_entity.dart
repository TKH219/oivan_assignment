import 'package:json_annotation/json_annotation.dart';

part 'sof_user_reputation_entity.g.dart';

@JsonSerializable()
class SofUserReputationEntity extends Object {
  @JsonKey(name: 'reputation_history_type')
  String reputationHistoryType;
  @JsonKey(name: 'reputation_change')
  int reputationChange;
  @JsonKey(name: 'creation_date')
  int creationDate;
  @JsonKey(name: 'post_id')
  int postId;
  @JsonKey(name: 'user_id')
  int userId;

  SofUserReputationEntity({
    required this.reputationHistoryType,
    required this.reputationChange,
    required this.postId,
    required this.userId,
    required this.creationDate,
  });

  factory SofUserReputationEntity.fromJson(Map<String, dynamic> json) => _$SofUserReputationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SofUserReputationEntityToJson(this);

  DateTime get creationDateTime => DateTime.fromMillisecondsSinceEpoch(this.creationDate);
}
