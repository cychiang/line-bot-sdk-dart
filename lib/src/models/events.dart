import 'package:json_annotation/json_annotation.dart';
import 'package:line_bot_sdk_dart/src/models/message_objects.dart';

part 'events.g.dart';
part 'events_utils.dart';

@JsonSerializable()
class SourceUser {
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'userId')
  String userId;

  SourceUser({
    this.type,
    this.userId
  });
  factory SourceUser.fromJson(Map<String, dynamic> json) =>
      _$SourceUserFromJson(json);

  Map<String, dynamic> toJson() => _$SourceUserToJson(this);
}

@JsonSerializable()
class SourceGroup {
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'groupId')
  String groupId;
  @JsonKey(name: 'userId')
  String userId;

  SourceGroup({
    this.type,
    this.groupId,
    this.userId
  });
  factory SourceGroup.fromJson(Map<String, dynamic> json) =>
      _$SourceGroupFromJson(json);

  Map<String, dynamic> toJson() => _$SourceGroupToJson(this);
}

@JsonSerializable()
class SourceRoom {
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'roomId')
  String roomId;
  @JsonKey(name: 'userId')
  String userId;

  SourceRoom({
    this.type,
    this.roomId,
    this.userId
  });
  factory SourceRoom.fromJson(Map<String, dynamic> json) =>
      _$SourceRoomFromJson(json);

  Map<String, dynamic> toJson() => _$SourceRoomToJson(this);
}

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

  MessageEvent({
    this.replyToken,
    this.type,
    this.mode,
    this.timestamp,
    this.source,
    this.message
  });
  factory MessageEvent.fromJson(Map<String, dynamic> json) =>
      _$MessageEventFromJson(json);

  Map<String, dynamic> toJson() => _$MessageEventToJson(this);
}

@JsonSerializable()
class WebhookEvent {
  @JsonKey(name: 'destination')
  String destination;
  @JsonKey(name: 'events', fromJson: _EventInstance)
  List<dynamic> events;

  WebhookEvent(this.destination, this.events);

  factory WebhookEvent.fromJson(Map<String, dynamic> json) =>
      _$WebhookEventFromJson(json);

  Map<String, dynamic> toJson() => _$WebhookEventToJson(this);
}
