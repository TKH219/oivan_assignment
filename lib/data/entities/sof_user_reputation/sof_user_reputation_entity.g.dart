// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sof_user_reputation_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SofUserReputationEntity _$SofUserReputationEntityFromJson(
        Map<String, dynamic> json) =>
    SofUserReputationEntity(
      reputationHistoryType: json['reputation_history_type'] as String,
      reputationChange: json['reputation_change'] as int,
      postId: json['post_id'] as int,
      userId: json['user_id'] as int,
      creationDate: json['creation_date'] as int,
    );

Map<String, dynamic> _$SofUserReputationEntityToJson(
        SofUserReputationEntity instance) =>
    <String, dynamic>{
      'reputation_history_type': instance.reputationHistoryType,
      'reputation_change': instance.reputationChange,
      'creation_date': instance.creationDate,
      'post_id': instance.postId,
      'user_id': instance.userId,
    };
