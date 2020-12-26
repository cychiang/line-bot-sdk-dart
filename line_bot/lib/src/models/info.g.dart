// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BotInfo _$BotInfoFromJson(Map<String, dynamic> json) {
  return BotInfo(
    userId: json['userId'] as String,
    basicId: json['basicId'] as String,
    premiumId: json['premiumId'] as String,
    displayName: json['displayName'] as String,
    pictureUrl: json['pictureUrl'] as String,
    chatMode: json['chatMode'] as String,
    markAsReadMode: json['markAsReadMode'] as String,
  );
}

Map<String, dynamic> _$BotInfoToJson(BotInfo instance) => <String, dynamic>{
      'userId': instance.userId,
      'basicId': instance.basicId,
      'premiumId': instance.premiumId,
      'displayName': instance.displayName,
      'pictureUrl': instance.pictureUrl,
      'chatMode': instance.chatMode,
      'markAsReadMode': instance.markAsReadMode,
    };
