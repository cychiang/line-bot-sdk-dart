part of '../messages.dart';

@JsonSerializable()
class Message {
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'text')
  String text;

  Message({this.type, this.text});

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
