import 'package:json_annotation/json_annotation.dart';

part 'events.g.dart';

@JsonSerializable()
class MessageEvent {
  @JsonKey(name: 'replyToken')
  String replyToken;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'mode')
  String mode;

  MessageEvent({
    this.replyToken,
    this.type,
    this.mode,
  });
  factory MessageEvent.fromJson(Map<String, dynamic> json) =>
      _$MessageEventFromJson(json);

  Map<String, dynamic> toJson() => _$MessageEventToJson(this);
}

@JsonSerializable()
class FollowEvent {
  @JsonKey(name: 'replyToken')
  String replyToken;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'mode')
  String mode;

  FollowEvent({
    this.replyToken,
    this.type,
    this.mode,
  });
  factory FollowEvent.fromJson(Map<String, dynamic> json) =>
      _$FollowEventFromJson(json);

  Map<String, dynamic> toJson() => _$FollowEventToJson(this);
}

@JsonSerializable()
class WebhookEvent {
  @JsonKey(name: 'destination')
  String destination;
  @JsonKey(name: 'events', fromJson: _dynamicAssignEvent)
  List<dynamic> events;

  WebhookEvent(this.destination, this.events);

  factory WebhookEvent.fromJson(Map<String, dynamic> json) =>
      _$WebhookEventFromJson(json);

  Map<String, dynamic> toJson() => _$WebhookEventToJson(this);

  static List<dynamic> _dynamicAssignEvent(List events) {
    var _events = <dynamic>[];
    // create a new list of object
    events.forEach((event) {
      _events.add(MessageEvent.fromJson(event));
      _events.add(FollowEvent.fromJson(event));
    });
    return _events;
  }
}
