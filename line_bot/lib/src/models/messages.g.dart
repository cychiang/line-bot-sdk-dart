// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    type: json['type'] as String,
    text: json['text'] as String,
  )..quickReply = json['quickReply'] == null
      ? null
      : QuickReply.fromJson(json['quickReply'] as Map<String, dynamic>);
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'type': instance.type,
      'text': instance.text,
      'quickReply': instance.quickReply,
    };

PushMessage _$PushMessageFromJson(Map<String, dynamic> json) {
  return PushMessage(
    to: (json['to'] as List)?.map((e) => e as String)?.toList(),
    messages: (json['messages'] as List)
        ?.map((e) =>
            e == null ? null : Message.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    notificationDisabled: json['notificationDisabled'] as bool ?? false,
  );
}

Map<String, dynamic> _$PushMessageToJson(PushMessage instance) =>
    <String, dynamic>{
      'to': instance.to,
      'messages': instance.messages,
      'notificationDisabled': instance.notificationDisabled,
    };

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    type: json['type'] as String,
    imageUrl: json['imageUrl'] as String,
    action: json['action'],
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'type': instance.type,
      'imageUrl': instance.imageUrl,
      'action': instance.action,
    };

QuickReply _$QuickReplyFromJson(Map<String, dynamic> json) {
  return QuickReply(
    items: (json['items'] as List)
        ?.map(
            (e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$QuickReplyToJson(QuickReply instance) =>
    <String, dynamic>{
      'items': instance.items,
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
