part of '../events.dart';

@JsonSerializable()
class Unsend {
  @JsonKey(name: 'messageId')
  String messageId;

  Unsend({this.messageId});

  factory Unsend.fromJson(Map<String, dynamic> json) => _$UnsendFromJson(json);

  Map<String, dynamic> toJson() => _$UnsendToJson(this);
}

@JsonSerializable()
class UnsendEvent {
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'mode')
  String mode;
  @JsonKey(name: 'timestamp')
  int timestamp;
  @JsonKey(name: 'source', fromJson: _SourceInstance)
  dynamic source;
  @JsonKey(name: 'unsend')
  Unsend unsend;

  UnsendEvent({this.type, this.mode, this.timestamp, this.source, this.unsend});
  factory UnsendEvent.fromJson(Map<String, dynamic> json) =>
      _$UnsendEventFromJson(json);

  Map<String, dynamic> toJson() => _$UnsendEventToJson(this);
}
