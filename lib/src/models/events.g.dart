// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageEvent _$MessageEventFromJson(Map<String, dynamic> json) {
  return MessageEvent(
    replyToken: json['replyToken'] as String,
    type: json['type'] as String,
    mode: json['mode'] as String,
  );
}

Map<String, dynamic> _$MessageEventToJson(MessageEvent instance) =>
    <String, dynamic>{
      'replyToken': instance.replyToken,
      'type': instance.type,
      'mode': instance.mode,
    };

FollowEvent _$FollowEventFromJson(Map<String, dynamic> json) {
  return FollowEvent(
    replyToken: json['replyToken'] as String,
    type: json['type'] as String,
    mode: json['mode'] as String,
  );
}

Map<String, dynamic> _$FollowEventToJson(FollowEvent instance) =>
    <String, dynamic>{
      'replyToken': instance.replyToken,
      'type': instance.type,
      'mode': instance.mode,
    };

WebhookEvent _$WebhookEventFromJson(Map<String, dynamic> json) {
  return WebhookEvent(
    json['destination'] as String,
    WebhookEvent._dynamicAssignEvent(json['events'] as List),
  );
}

Map<String, dynamic> _$WebhookEventToJson(WebhookEvent instance) =>
    <String, dynamic>{
      'destination': instance.destination,
      'events': instance.events,
    };
