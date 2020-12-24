part of '../events.dart';

@JsonSerializable()
class UnfollowEvent {
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'mode')
  String mode;
  @JsonKey(name: 'timestamp')
  int timestamp;
  @JsonKey(name: 'source', fromJson: _SourceInstance)
  dynamic source;

  UnfollowEvent({this.type, this.mode, this.timestamp, this.source});
  factory UnfollowEvent.fromJson(Map<String, dynamic> json) =>
      _$UnfollowEventFromJson(json);

  Map<String, dynamic> toJson() => _$UnfollowEventToJson(this);
}
