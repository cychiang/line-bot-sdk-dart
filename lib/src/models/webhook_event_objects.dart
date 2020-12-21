import 'package:json_annotation/json_annotation.dart';

part 'webhook_event_objects.g.dart';

@JsonSerializable()
class Source {
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'userId')
  String userId;
  @JsonKey(name: 'groupId')
  String groupId;
  @JsonKey(name: 'roomId')
  String roomId;

  Source({this.type, this.userId, this.groupId, this.roomId});
  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}

@JsonSerializable()
class ContentProvider {
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'originalContentUrl')
  String originalContentUrl;
  @JsonKey(name: 'previewImageUrl')
  String previewImageUrl;

  ContentProvider({this.type, this.originalContentUrl, this.previewImageUrl});
  factory ContentProvider.fromJson(Map<String, dynamic> json) =>
      _$ContentProviderFromJson(json);

  Map<String, dynamic> toJson() => _$ContentProviderToJson(this);
}

@JsonSerializable()
class Emojis {
  @JsonKey(name: 'index')
  int index;
  @JsonKey(name: 'length')
  int length;
  @JsonKey(name: 'productId')
  String productId;
  @JsonKey(name: 'emojiId')
  String emojiId;

  Emojis({this.index, this.length, this.productId, this.emojiId});
  factory Emojis.fromJson(Map<String, dynamic> json) => _$EmojisFromJson(json);

  Map<String, dynamic> toJson() => _$EmojisToJson(this);
}

@JsonSerializable()
class Message {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'text')
  String text;
  @JsonKey(name: 'emojis')
  Emojis emojis;
  @JsonKey(name: 'duration')
  int duration;
  @JsonKey(name: 'contentProvider')
  ContentProvider contentProvider;
  @JsonKey(name: 'fileName')
  String fileName;
  @JsonKey(name: 'fileSize')
  int fileSize;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'address')
  String address;
  @JsonKey(name: 'latitude')
  double latitude;
  @JsonKey(name: 'longitude')
  double longitude;
  @JsonKey(name: 'packageId')
  String packageId;
  @JsonKey(name: 'stickerId')
  String stickerId;
  @JsonKey(name: 'stickerResourceType')
  String stickerResourceType;
  @JsonKey(name: 'keywords')
  List<String> keywords;

  Message(
      {this.id,
      this.type,
      this.text,
      this.emojis,
      this.duration,
      this.contentProvider,
      this.fileName,
      this.fileSize,
      this.title,
      this.address,
      this.latitude,
      this.longitude,
      this.packageId,
      this.stickerId,
      this.stickerResourceType,
      this.keywords});

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

@JsonSerializable()
class Unsend {
  @JsonKey(name: 'messageId')
  String messageId;

  Unsend({this.messageId});

  factory Unsend.fromJson(Map<String, dynamic> json) => _$UnsendFromJson(json);

  Map<String, dynamic> toJson() => _$UnsendToJson(this);
}

@JsonSerializable()
class Joined {
  @JsonKey(name: 'members')
  List<Source> members;

  Joined({this.members});

  factory Joined.fromJson(Map<String, dynamic> json) => _$JoinedFromJson(json);

  Map<String, dynamic> toJson() => _$JoinedToJson(this);
}

@JsonSerializable()
class Left {
  @JsonKey(name: 'members')
  List<Source> members;

  Left({this.members});

  factory Left.fromJson(Map<String, dynamic> json) => _$LeftFromJson(json);

  Map<String, dynamic> toJson() => _$LeftToJson(this);
}

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
class VideoPlayComplete {
  @JsonKey(name: 'trackingId')
  String trackingId;

  VideoPlayComplete({this.trackingId});

  factory VideoPlayComplete.fromJson(Map<String, dynamic> json) =>
      _$VideoPlayCompleteFromJson(json);

  Map<String, dynamic> toJson() => _$VideoPlayCompleteToJson(this);
}

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
class Link {
  @JsonKey(name: 'result')
  String result;
  @JsonKey(name: 'nonce')
  String nonce;

  Link({this.result, this.nonce});

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

  Map<String, dynamic> toJson() => _$LinkToJson(this);
}

@JsonSerializable()
class ActionResults {
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'data')
  String data;

  ActionResults({this.type, this.data});

  factory ActionResults.fromJson(Map<String, dynamic> json) =>
      _$ActionResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ActionResultsToJson(this);
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
  List<ActionResults> actionResults;
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
class Things {
  @JsonKey(name: 'deviceId')
  String deviceId;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'result')
  Result result;

  Things({this.deviceId, this.type, this.result});

  factory Things.fromJson(Map<String, dynamic> json) => _$ThingsFromJson(json);

  Map<String, dynamic> toJson() => _$ThingsToJson(this);
}

@JsonSerializable()
class Events {
  @JsonKey(name: 'replyToken')
  String replyToken;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'mode')
  String mode;
  @JsonKey(name: 'timestamp')
  int timestamp;
  @JsonKey(name: 'source')
  Source source;
  @JsonKey(name: 'message')
  Message message;
  @JsonKey(name: 'unsend')
  Unsend unsend;
  @JsonKey(name: 'joined')
  Joined joined;
  @JsonKey(name: 'left')
  Left left;
  @JsonKey(name: 'postback')
  Postback postback;
  @JsonKey(name: 'videoPlayComplete')
  VideoPlayComplete videoPlayComplete;
  @JsonKey(name: 'beacon')
  Beacon beacon;
  @JsonKey(name: 'link')
  Link link;
  @JsonKey(name: 'things')
  Things things;

  Events(
      {this.replyToken,
      this.type,
      this.mode,
      this.timestamp,
      this.source,
      this.message,
      this.unsend,
      this.joined,
      this.left,
      this.postback,
      this.videoPlayComplete,
      this.beacon,
      this.link,
      this.things});
  factory Events.fromJson(Map<String, dynamic> json) => _$EventsFromJson(json);

  Map<String, dynamic> toJson() => _$EventsToJson(this);
}

@JsonSerializable()
class WebhookEventObjects {
  @JsonKey(name: 'destination')
  String destination;
  @JsonKey(name: 'events')
  List<Events> events;

  WebhookEventObjects({this.destination, this.events});
  factory WebhookEventObjects.fromJson(Map<String, dynamic> json) =>
      _$WebhookEventObjectsFromJson(json);

  Map<String, dynamic> toJson() => _$WebhookEventObjectsToJson(this);
}
