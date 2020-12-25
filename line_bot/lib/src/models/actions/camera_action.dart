part of '../actions.dart';

@JsonSerializable()
class CameraAction {
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'label')
  String label;

  CameraAction({this.type, this.label});

  factory CameraAction.fromJson(Map<String, dynamic> json) =>
      _$CameraActionFromJson(json);

  Map<String, dynamic> toJson() => _$CameraActionToJson(this);
}
