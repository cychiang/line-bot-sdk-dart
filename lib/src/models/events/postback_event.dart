part of '../events.dart';

@JsonSerializable()
class Params {
  @JsonKey(name: 'date')
  String date;
  @JsonKey(name: 'time')
  String time;
  @JsonKey(name: 'datetime')
  String datetime;

  Params({this.date, this.time, this.datetime});

  factory Params.fromJson(Map<String, dynamic> json) => _$ParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ParamsToJson(this);
}

@JsonSerializable()
class Postback {
  @JsonKey(name: 'data')
  String data;
  @JsonKey(name: 'params')
  Params params;

  Postback({this.data, this.params});

  factory Postback.fromJson(Map<String, dynamic> json) =>
      _$PostbackFromJson(json);

  Map<String, dynamic> toJson() => _$PostbackToJson(this);
}

@JsonSerializable()
class PostbackEvent {
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
  @JsonKey(name: 'postback')
  Postback postback;

  PostbackEvent(
      {this.replyToken,
      this.type,
      this.mode,
      this.timestamp,
      this.source,
      this.postback});
  factory PostbackEvent.fromJson(Map<String, dynamic> json) =>
      _$PostbackEventFromJson(json);

  Map<String, dynamic> toJson() => _$PostbackEventToJson(this);
}
