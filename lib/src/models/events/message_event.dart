part of '../events.dart';

@JsonSerializable()
class MessageEvent {
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
  @JsonKey(name: 'message', fromJson: _MessageInstance)
  dynamic message;

  MessageEvent(
      {this.replyToken,
      this.type,
      this.mode,
      this.timestamp,
      this.source,
      this.message});
  factory MessageEvent.fromJson(Map<String, dynamic> json) =>
      _$MessageEventFromJson(json);

  Map<String, dynamic> toJson() => _$MessageEventToJson(this);
}
