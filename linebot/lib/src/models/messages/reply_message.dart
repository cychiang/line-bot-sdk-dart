part of '../messages.dart';

@JsonSerializable()
class ReplyMessage {
  @JsonKey(name: 'replyToken')
  String replyToken;
  @JsonKey(name: 'messages')
  List<Message> messages;
  @JsonKey(name: 'notificationDisabled', defaultValue: false)
  bool notificationDisabled;

  ReplyMessage({this.replyToken, this.messages, this.notificationDisabled});

  factory ReplyMessage.fromJson(Map<String, dynamic> json) =>
      _$ReplyMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ReplyMessageToJson(this);
}
