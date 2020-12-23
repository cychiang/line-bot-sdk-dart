part of 'webhook_event.dart';

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
class AccountLinkEvent {
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
  @JsonKey(name: 'link')
  Link link;

  AccountLinkEvent(
      {this.replyToken,
        this.type,
        this.mode,
        this.timestamp,
        this.source,
        this.link});
  factory AccountLinkEvent.fromJson(Map<String, dynamic> json) =>
      _$AccountLinkEventFromJson(json);

  Map<String, dynamic> toJson() => _$AccountLinkEventToJson(this);
}
