part of '../actions.dart';

@JsonSerializable()
class CameraRollAction {
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'label')
  String label;

  CameraRollAction({this.type, this.label});

  factory CameraRollAction.fromJson(Map<String, dynamic> json) =>
      _$CameraRollActionFromJson(json);

  Map<String, dynamic> toJson() => _$CameraRollActionToJson(this);
}
