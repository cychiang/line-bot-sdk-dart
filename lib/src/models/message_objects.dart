import 'package:json_annotation/json_annotation.dart';

part 'message_objects.g.dart';

@JsonSerializable()
class Emojis {
  @JsonKey(name: 'index')
  int index;
  @JsonKey(name: 'productId')
  String productId;
  @JsonKey(name: 'emojiId')
  String emojiId;

  Emojis({this.index, this.productId, this.emojiId});
  factory Emojis.fromJson(Map<String, dynamic> json) => _$EmojisFromJson(json);

  Map<String, dynamic> toJson() => _$EmojisToJson(this);
}

@JsonSerializable()
class TextMessage {
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'text')
  String text;
  @JsonKey(name: 'emojis', includeIfNull: false)
  List<Emojis> emojis;

  TextMessage({this.type, this.text, this.emojis});
  factory TextMessage.fromJson(Map<String, dynamic> json) =>
      _$TextMessageFromJson(json);

  Map<String, dynamic> toJson() => _$TextMessageToJson(this);
}
