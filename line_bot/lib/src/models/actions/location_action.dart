part of '../actions.dart';

@JsonSerializable()
class LocationAction {
  @JsonKey(name: 'type', defaultValue: 'location')
  String type;
  @JsonKey(name: 'label', required: true)
  String label;

  LocationAction({this.type, this.label});

  factory LocationAction.fromJson(Map<String, dynamic> json) =>
      _$LocationActionFromJson(json);

  Map<String, dynamic> toJson() => _$LocationActionToJson(this);
}
