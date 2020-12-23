// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_objects.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Emojis _$EmojisFromJson(Map<String, dynamic> json) {
  return Emojis(
    index: json['index'] as int,
    productId: json['productId'] as String,
    emojiId: json['emojiId'] as String,
  );
}

Map<String, dynamic> _$EmojisToJson(Emojis instance) => <String, dynamic>{
      'index': instance.index,
      'productId': instance.productId,
      'emojiId': instance.emojiId,
    };

TextMessage _$TextMessageFromJson(Map<String, dynamic> json) {
  return TextMessage(
    id: json['id'] as String,
    type: json['type'] as String,
    text: json['text'] as String,
    emojis: (json['emojis'] as List)
        ?.map((e) =>
            e == null ? null : Emojis.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TextMessageToJson(TextMessage instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'text': instance.text,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('emojis', instance.emojis);
  return val;
}
