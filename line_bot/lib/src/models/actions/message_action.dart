part of '../actions.dart';

@JsonSerializable()
class MessageAction {
  @JsonKey(name: 'type', defaultValue: 'message', required: true)
  String type;
  @JsonKey(name: 'label')
  String label;
  @JsonKey(name: 'text', required: true)
  String text;

  MessageAction({this.type, this.label, this.text});

  factory MessageAction.fromJson(Map<String, dynamic> json) =>
      _$MessageActionFromJson(json);

  Map<String, dynamic> toJson() => _$MessageActionToJson(this);
}
