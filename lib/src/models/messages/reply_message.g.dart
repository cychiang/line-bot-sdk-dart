// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reply_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReplyMessage _$ReplyMessageFromJson(Map<String, dynamic> json) {
  return ReplyMessage(
    replyToken: json['replyToken'] as String,
    messages: (json['messages'] as List)
        ?.map((e) => e as Map<String, dynamic>)
        ?.toList(),
    notificationDisabled: json['notificationDisabled'] as bool,
  );
}

Map<String, dynamic> _$ReplyMessageToJson(ReplyMessage instance) {
  final val = <String, dynamic>{
    'replyToken': instance.replyToken,
    'messages': instance.messages,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('notificationDisabled', instance.notificationDisabled);
  return val;
}
