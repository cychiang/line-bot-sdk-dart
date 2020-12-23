part of 'webhook_event.dart';

@JsonSerializable()
class LeaveEvent {
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'mode')
  String mode;
  @JsonKey(name: 'timestamp')
  int timestamp;
  @JsonKey(name: 'source', fromJson: _SourceInstance)
  dynamic source;

  LeaveEvent({this.type, this.mode, this.timestamp, this.source});
  factory LeaveEvent.fromJson(Map<String, dynamic> json) =>
      _$LeaveEventFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveEventToJson(this);
}
