part of '../messages.dart';

@JsonSerializable()
class PushMessage {
  @JsonKey(name: 'to')
  List<String> to;
  @JsonKey(name: 'messages')
  List<Message> messages;
  @JsonKey(name: 'notificationDisabled', defaultValue: false)
  bool notificationDisabled;

  PushMessage({this.to, this.messages, this.notificationDisabled});

  factory PushMessage.fromJson(Map<String, dynamic> json) =>
      _$PushMessageFromJson(json);

  Map<String, dynamic> toJson() => _$PushMessageToJson(this);
}
