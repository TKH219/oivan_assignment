// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse(
      hasMore: json['has_more'] as bool?,
      quotaMax: json['quota_max'] as int?,
      quotaRemaining: json['quota_remaining'] as int?,
    );

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'has_more': instance.hasMore,
      'quota_max': instance.quotaMax,
      'quota_remaining': instance.quotaRemaining,
    };
