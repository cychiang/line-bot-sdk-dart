// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Followers _$FollowersFromJson(Map<String, dynamic> json) {
  return Followers(
    userIds: (json['userIds'] as List)?.map((e) => e as String)?.toList(),
    next: json['next'] as String,
  );
}

Map<String, dynamic> _$FollowersToJson(Followers instance) => <String, dynamic>{
      'userIds': instance.userIds,
      'next': instance.next,
    };

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile(
    displayName: json['displayName'] as String,
    userId: json['userId'] as String,
    language: json['language'] as String,
    pictureUrl: json['pictureUrl'] as String,
    statusMessage: json['statusMessage'] as String,
  );
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'displayName': instance.displayName,
      'userId': instance.userId,
      'language': instance.language,
      'pictureUrl': instance.pictureUrl,
      'statusMessage': instance.statusMessage,
    };