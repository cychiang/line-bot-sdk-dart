// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SourceUser _$SourceUserFromJson(Map<String, dynamic> json) {
  return SourceUser(
    type: json['type'] as String,
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$SourceUserToJson(SourceUser instance) =>
    <String, dynamic>{
      'type': instance.type,
      'userId': instance.userId,
    };

SourceGroup _$SourceGroupFromJson(Map<String, dynamic> json) {
  return SourceGroup(
    type: json['type'] as String,
    groupId: json['groupId'] as String,
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$SourceGroupToJson(SourceGroup instance) =>
    <String, dynamic>{
      'type': instance.type,
      'groupId': instance.groupId,
      'userId': instance.userId,
    };

SourceRoom _$SourceRoomFromJson(Map<String, dynamic> json) {
  return SourceRoom(
    type: json['type'] as String,
    roomId: json['roomId'] as String,
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$SourceRoomToJson(SourceRoom instance) =>
    <String, dynamic>{
      'type': instance.type,
      'roomId': instance.roomId,
      'userId': instance.userId,
    };

MessageEvent _$MessageEventFromJson(Map<String, dynamic> json) {
  return MessageEvent(
    replyToken: json['replyToken'] as String,
    type: json['type'] as String,
    mode: json['mode'] as String,
    timestamp: json['timestamp'] as int,
    source: _SourceInstance(json['source'] as Map<String, dynamic>),
    message: _MessageInstance(json['message'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MessageEventToJson(MessageEvent instance) =>
    <String, dynamic>{
      'replyToken': instance.replyToken,
      'type': instance.type,
      'mode': instance.mode,
      'timestamp': instance.timestamp,
      'source': instance.source,
      'message': instance.message,
    };

WebhookEvent _$WebhookEventFromJson(Map<String, dynamic> json) {
  return WebhookEvent(
    json['destination'] as String,
    _EventInstance(json['events'] as List),
  );
}

Map<String, dynamic> _$WebhookEventToJson(WebhookEvent instance) =>
    <String, dynamic>{
      'destination': instance.destination,
      'events': instance.events,
    };
