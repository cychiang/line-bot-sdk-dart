part of '../events.dart';

@JsonSerializable()
class ActionResult {
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'data')
  String data;

  ActionResult({this.type, this.data});

  factory ActionResult.fromJson(Map<String, dynamic> json) =>
      _$ActionResultFromJson(json);

  Map<String, dynamic> toJson() => _$ActionResultToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: 'scenarioId')
  String scenarioId;
  @JsonKey(name: 'revision')
  int revision;
  @JsonKey(name: 'startTime')
  int startTime;
  @JsonKey(name: 'endTime')
  int endTime;
  @JsonKey(name: 'resultCode')
  String resultCode;
  @JsonKey(name: 'actionResults')
  List<ActionResult> actionResults;
  @JsonKey(name: 'bleNotificationPayload')
  String bleNotificationPayload;
  @JsonKey(name: 'errorReason')
  String errorReason;

  Result(
      {this.scenarioId,
      this.revision,
      this.startTime,
      this.endTime,
      this.resultCode,
      this.actionResults,
      this.bleNotificationPayload,
      this.errorReason});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class ScenarioResult {
  @JsonKey(name: 'deviceId')
  String deviceId;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'result')
  Result result;

  ScenarioResult({this.deviceId, this.type, this.result});

  factory ScenarioResult.fromJson(Map<String, dynamic> json) =>
      _$ScenarioResultFromJson(json);

  Map<String, dynamic> toJson() => _$ScenarioResultToJson(this);
}

@JsonSerializable()
class DeviceUnlink {
  @JsonKey(name: 'deviceId')
  String deviceId;
  @JsonKey(name: 'type')
  String type;

  DeviceUnlink({this.deviceId, this.type});

  factory DeviceUnlink.fromJson(Map<String, dynamic> json) =>
      _$DeviceUnlinkFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceUnlinkToJson(this);
}

@JsonSerializable()
class DeviceLink {
  @JsonKey(name: 'deviceId')
  String deviceId;
  @JsonKey(name: 'type')
  String type;

  DeviceLink({this.deviceId, this.type});

  factory DeviceLink.fromJson(Map<String, dynamic> json) =>
      _$DeviceLinkFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceLinkToJson(this);
}

@JsonSerializable()
class ThingsEvent {
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
  @JsonKey(name: 'things', fromJson: _ThingsInstance)
  dynamic things;

  ThingsEvent(
      {this.replyToken,
      this.type,
      this.mode,
      this.timestamp,
      this.source,
      this.things});
  factory ThingsEvent.fromJson(Map<String, dynamic> json) =>
      _$ThingsEventFromJson(json);

  Map<String, dynamic> toJson() => _$ThingsEventToJson(this);
}
