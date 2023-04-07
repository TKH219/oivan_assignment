// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_sof_user_reputation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSofUserReputationResponse _$GetSofUserReputationResponseFromJson(
        Map<String, dynamic> json) =>
    GetSofUserReputationResponse(
      items: (json['items'] as List<dynamic>)
          .map((e) =>
              SofUserReputationEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..hasMore = json['has_more'] as bool?
      ..quotaMax = json['quota_max'] as int?
      ..quotaRemaining = json['quota_remaining'] as int?;

Map<String, dynamic> _$GetSofUserReputationResponseToJson(
        GetSofUserReputationResponse instance) =>
    <String, dynamic>{
      'has_more': instance.hasMore,
      'quota_max': instance.quotaMax,
      'quota_remaining': instance.quotaRemaining,
      'items': instance.items,
    };
