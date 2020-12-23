part of 'webhook_event.dart';

@JsonSerializable()
class JoinEvent {
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

  JoinEvent(
      {this.replyToken, this.type, this.mode, this.timestamp, this.source});
  factory JoinEvent.fromJson(Map<String, dynamic> json) =>
      _$JoinEventFromJson(json);

  Map<String, dynamic> toJson() => _$JoinEventToJson(this);
}
