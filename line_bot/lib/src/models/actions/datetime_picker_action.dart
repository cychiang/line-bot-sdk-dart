part of '../actions.dart';

@JsonSerializable()
class DatetimePickerAction {
  @JsonKey(name: 'type', defaultValue: 'datetimepicker')
  String type;
  @JsonKey(name: 'label')
  String label;
  @JsonKey(name: 'data', required: true)
  String data;
  @JsonKey(name: 'mode', required: true)
  String mode;
  @JsonKey(name: 'initial')
  String initial;
  @JsonKey(name: 'max')
  String max;
  @JsonKey(name: 'min')
  String min;

  DatetimePickerAction(
      {this.type,
      this.label,
      this.data,
      this.mode,
      this.initial,
      this.max,
      this.min});

  factory DatetimePickerAction.fromJson(Map<String, dynamic> json) =>
      _$DatetimePickerActionFromJson(json);

  Map<String, dynamic> toJson() => _$DatetimePickerActionToJson(this);
}
