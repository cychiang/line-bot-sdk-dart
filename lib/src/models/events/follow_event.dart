part of '../events.dart';

@JsonSerializable()
class FollowEvent {
  @JsonKey(name: 'replyToken')
  String replyToken;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'mode')
  String mode;
  @JsonKey(name: 'timestamp')
  int timestamp;
  @JsonKey(name: 'source', fromJson: _SourceInstance)
  dynamic source;

  FollowEvent(
      {this.replyToken, this.type, this.mode, this.timestamp, this.source});
  factory FollowEvent.fromJson(Map<String, dynamic> json) =>
      _$FollowEventFromJson(json);

  Map<String, dynamic> toJson() => _$FollowEventToJson(this);
}
