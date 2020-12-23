// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    type: json['type'] as String,
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'type': instance.type,
      'text': instance.text,
    };

ReplyMessage _$ReplyMessageFromJson(Map<String, dynamic> json) {
  return ReplyMessage(
    replyToken: json['replyToken'] as String,
    messages: (json['messages'] as List)
        ?.map((e) =>
            e == null ? null : Message.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    notificationDisabled: json['notificationDisabled'] as bool ?? false,
  );
}

Map<String, dynamic> _$ReplyMessageToJson(ReplyMessage instance) =>
    <String, dynamic>{
      'replyToken': instance.replyToken,
      'messages': instance.messages,
      'notificationDisabled': instance.notificationDisabled,
    };
