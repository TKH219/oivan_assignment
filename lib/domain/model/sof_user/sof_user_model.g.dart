// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sof_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SofUserModel _$SofUserModelFromJson(Map<String, dynamic> json) => SofUserModel(
      accountId: json['accountId'] as int,
      userId: json['userId'] as int,
      profileImage: json['profileImage'] as String,
      displayName: json['displayName'] as String,
      reputation: json['reputation'] as int,
      location: json['location'] as String?,
      age: json['age'] as int?,
    );

Map<String, dynamic> _$SofUserModelToJson(SofUserModel instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'userId': instance.userId,
      'profileImage': instance.profileImage,
      'displayName': instance.displayName,
      'reputation': instance.reputation,
      'location': instance.location,
      'age': instance.age,
    };
