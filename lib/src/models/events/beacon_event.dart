part of 'webhook_event.dart';

@JsonSerializable()
class Beacon {
  @JsonKey(name: 'hwid')
  String hwid;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'dm')
  String dm;

  Beacon({this.hwid, this.type, this.dm});

  factory Beacon.fromJson(Map<String, dynamic> json) => _$BeaconFromJson(json);

  Map<String, dynamic> toJson() => _$BeaconToJson(this);
}

@JsonSerializable()
class BeaconEvent {
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
  @JsonKey(name: 'beacon')
  Beacon beacon;

  BeaconEvent(
      {this.replyToken,
        this.type,
        this.mode,
        this.timestamp,
        this.source,
        this.beacon});
  factory BeaconEvent.fromJson(Map<String, dynamic> json) =>
      _$BeaconEventFromJson(json);

  Map<String, dynamic> toJson() => _$BeaconEventToJson(this);
}
