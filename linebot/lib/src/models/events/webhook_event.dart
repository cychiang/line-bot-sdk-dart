part of '../events.dart';

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
