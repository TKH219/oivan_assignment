// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sof_user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SofUserEntity _$SofUserEntityFromJson(Map<String, dynamic> json) =>
    SofUserEntity(
      accountId: json['account_id'] as int,
      userId: json['user_id'] as int,
      profileImage: json['profile_image'] as String,
      displayName: json['display_name'] as String,
      reputation: json['reputation'] as int,
      location: json['location'] as String?,
      age: json['age'] as int?,
    );

Map<String, dynamic> _$SofUserEntityToJson(SofUserEntity instance) =>
    <String, dynamic>{
      'account_id': instance.accountId,
      'user_id': instance.userId,
      'profile_image': instance.profileImage,
      'display_name': instance.displayName,
      'location': instance.location,
      'reputation': instance.reputation,
      'age': instance.age,
    };
