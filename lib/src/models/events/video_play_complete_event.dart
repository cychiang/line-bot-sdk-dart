part of 'webhook_event.dart';

@JsonSerializable()
class VideoPlayComplete {
  @JsonKey(name: 'trackingId')
  String trackingId;

  VideoPlayComplete({this.trackingId});

  factory VideoPlayComplete.fromJson(Map<String, dynamic> json) =>
      _$VideoPlayCompleteFromJson(json);

  Map<String, dynamic> toJson() => _$VideoPlayCompleteToJson(this);
}

@JsonSerializable()
class VideoPlayCompleteEvent {
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
  @JsonKey(name: 'videoPlayComplete')
  VideoPlayComplete videoPlayComplete;

  VideoPlayCompleteEvent({this.replyToken, this.type, this.mode, this.timestamp, this.source, this.videoPlayComplete});
  factory VideoPlayCompleteEvent.fromJson(Map<String, dynamic> json) =>
      _$VideoPlayCompleteEventFromJson(json);

  Map<String, dynamic> toJson() => _$VideoPlayCompleteEventToJson(this);
}
