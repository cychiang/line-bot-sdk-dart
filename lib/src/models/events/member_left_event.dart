part of 'webhook_event.dart';

@JsonSerializable()
class Left {
  @JsonKey(name: 'members', fromJson: _ListSourceInstance)
  List<dynamic> members;

  Left({this.members});

  factory Left.fromJson(Map<String, dynamic> json) => _$LeftFromJson(json);

  Map<String, dynamic> toJson() => _$LeftToJson(this);
}

@JsonSerializable()
class MemberLeftEvent {
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
  @JsonKey(name: 'left')
  Left left;

  MemberLeftEvent(
      {this.replyToken,
        this.type,
        this.mode,
        this.timestamp,
        this.source,
        this.left});
  factory MemberLeftEvent.fromJson(Map<String, dynamic> json) =>
      _$MemberLeftEventFromJson(json);

  Map<String, dynamic> toJson() => _$MemberLeftEventToJson(this);
}
