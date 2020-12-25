part of '../actions.dart';

@JsonSerializable()
class CameraAction {
  @JsonKey(name: 'type', defaultValue: 'camera')
  String type;
  @JsonKey(name: 'label', required: true)
  String label;

  CameraAction({this.type, this.label});

  factory CameraAction.fromJson(Map<String, dynamic> json) =>
      _$CameraActionFromJson(json);

  Map<String, dynamic> toJson() => _$CameraActionToJson(this);
}
