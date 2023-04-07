// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sof_user_reputation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SofUserReputationModel _$SofUserReputationModelFromJson(
        Map<String, dynamic> json) =>
    SofUserReputationModel(
      reputationHistoryType: json['reputationHistoryType'] as String,
      reputationChange: json['reputationChange'] as int,
      postId: json['postId'] as int,
      creationDate: DateTime.parse(json['creationDate'] as String),
      userId: json['userId'] as int,
    );

Map<String, dynamic> _$SofUserReputationModelToJson(
        SofUserReputationModel instance) =>
    <String, dynamic>{
      'reputationHistoryType': instance.reputationHistoryType,
      'reputationChange': instance.reputationChange,
      'creationDate': instance.creationDate.toIso8601String(),
      'postId': instance.postId,
      'userId': instance.userId,
    };
