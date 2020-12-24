part of '../events.dart';

@JsonSerializable()
class Joined {
  @JsonKey(name: 'members', fromJson: _ListSourceInstance)
  List<dynamic> members;

  Joined({this.members});

  factory Joined.fromJson(Map<String, dynamic> json) => _$JoinedFromJson(json);

  Map<String, dynamic> toJson() => _$JoinedToJson(this);
}

@JsonSerializable()
class MemberJoinedEvent {
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
  @JsonKey(name: 'joined')
  Joined joined;

  MemberJoinedEvent(
      {this.replyToken,
      this.type,
      this.mode,
      this.timestamp,
      this.source,
      this.joined});
  factory MemberJoinedEvent.fromJson(Map<String, dynamic> json) =>
      _$MemberJoinedEventFromJson(json);

  Map<String, dynamic> toJson() => _$MemberJoinedEventToJson(this);
}
