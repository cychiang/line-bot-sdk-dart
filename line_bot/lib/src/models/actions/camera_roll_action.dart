part of '../actions.dart';

@JsonSerializable()
class CameraRollAction {
  @JsonKey(name: 'type', defaultValue: 'cameraRoll')
  String type;
  @JsonKey(name: 'label', required: true)
  String label;

  CameraRollAction({this.type, this.label});

  factory CameraRollAction.fromJson(Map<String, dynamic> json) =>
      _$CameraRollActionFromJson(json);

  Map<String, dynamic> toJson() => _$CameraRollActionToJson(this);
}
