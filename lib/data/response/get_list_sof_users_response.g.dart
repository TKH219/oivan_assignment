// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_list_sof_users_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetListSofUsersResponse _$GetListSofUsersResponseFromJson(
        Map<String, dynamic> json) =>
    GetListSofUsersResponse(
      items: (json['items'] as List<dynamic>)
          .map((e) => SofUserEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..hasMore = json['has_more'] as bool?
      ..quotaMax = json['quota_max'] as int?
      ..quotaRemaining = json['quota_remaining'] as int?;

Map<String, dynamic> _$GetListSofUsersResponseToJson(
        GetListSofUsersResponse instance) =>
    <String, dynamic>{
      'has_more': instance.hasMore,
      'quota_max': instance.quotaMax,
      'quota_remaining': instance.quotaRemaining,
      'items': instance.items,
    };
