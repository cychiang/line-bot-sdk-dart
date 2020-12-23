import 'package:json_annotation/json_annotation.dart';

part 'reply_message.g.dart';

@JsonSerializable()
class ReplyMessage {
  @JsonKey(name: 'replyToken')
  String replyToken;
  @JsonKey(name: 'messages')
  List<Map<String, dynamic>> messages;
  @JsonKey(name: 'notificationDisabled', includeIfNull: false)
  bool notificationDisabled;

  ReplyMessage({this.replyToken, this.messages, this.notificationDisabled});
  factory ReplyMessage.fromJson(Map<String, dynamic> json) =>
      _$ReplyMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ReplyMessageToJson(this);
}
