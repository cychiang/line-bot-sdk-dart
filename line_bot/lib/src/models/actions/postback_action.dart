part of '../actions.dart';

@JsonSerializable()
class PostbackAction {
  @JsonKey(name: 'type', defaultValue: 'postback')
  String type;
  @JsonKey(name: 'label')
  String label;
  @JsonKey(name: 'data', required: true)
  String data;
  @JsonKey(name: 'text')
  String text;

  PostbackAction({this.type, this.label, this.data, this.text});

  factory PostbackAction.fromJson(Map<String, dynamic> json) =>
      _$PostbackActionFromJson(json);

  Map<String, dynamic> toJson() => _$PostbackActionToJson(this);
}
