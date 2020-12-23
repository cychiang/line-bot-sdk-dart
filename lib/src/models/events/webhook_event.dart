import 'package:json_annotation/json_annotation.dart';

part 'webhook_event.g.dart';
part 'events_message.dart';
part 'events_source.dart';
part 'events_utils.dart';
part 'message_event.dart';
part 'follow_event.dart';
part 'unfollow_event.dart';
part 'join_event.dart';
part 'leave_event.dart';
part 'postback_event.dart';
part 'beacon_event.dart';
part 'account_link_event.dart';
part 'things_event.dart';
part 'member_joined_event.dart';
part 'member_left_event.dart';
part 'unsend_event.dart';
part 'video_play_complete_event.dart';

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
