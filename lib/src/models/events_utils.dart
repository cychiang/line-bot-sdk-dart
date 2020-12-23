part of 'events.dart';

List<dynamic> _EventInstance(List events) {
  var _events = <dynamic>[];
  events.forEach((event) {
    var _event = Map<String, dynamic>.from(event);
    if (_event.containsKey('type')){
      switch(_event['type']) {
        case 'message':
          _events.add(MessageEvent.fromJson(_event));
      }
    }
  });

  // if event_type == 'message':
  // events.append(MessageEvent.new_from_json_dict(event))
  // elif event_type == 'follow':
  // events.append(FollowEvent.new_from_json_dict(event))
  // elif event_type == 'unfollow':
  // events.append(UnfollowEvent.new_from_json_dict(event))
  // elif event_type == 'join':
  // events.append(JoinEvent.new_from_json_dict(event))
  // elif event_type == 'leave':
  // events.append(LeaveEvent.new_from_json_dict(event))
  // elif event_type == 'postback':
  // events.append(PostbackEvent.new_from_json_dict(event))
  // elif event_type == 'beacon':
  // events.append(BeaconEvent.new_from_json_dict(event))
  // elif event_type == 'accountLink':
  // events.append(AccountLinkEvent.new_from_json_dict(event))
  // elif event_type == 'memberJoined':
  // events.append(MemberJoinedEvent.new_from_json_dict(event))
  // elif event_type == 'memberLeft':
  // events.append(MemberLeftEvent.new_from_json_dict(event))
  // elif event_type == 'things':
  // events.append(ThingsEvent.new_from_json_dict(event))
  // elif event_type == 'unsend':
  // events.append(UnsendEvent.new_from_json_dict(event))
  // elif event_type == 'videoPlayComplete':
  // events.append(VideoPlayCompleteEvent.new_from_json_dict(event))
  // else:
  // LOGGER.warn('Unknown event type. type=' + event_type)

  return _events;
}

dynamic _SourceInstance(Map<String, dynamic> source) {
  var _source = Map<String, dynamic>.from(source);
  if (_source.containsKey('type')) {
    switch(_source['type']) {
      case 'user':
        return SourceUser.fromJson(_source);
      case 'group':
        return SourceGroup.fromJson(_source);
      case 'room':
        return SourceRoom.fromJson(_source);
    }
  }
  return _source;
}

dynamic _MessageInstance(Map<String, dynamic> message) {
  var _message = Map<String, dynamic>.from(message);
  if (_message.containsKey('type')) {
    switch(_message['type']) {
      case 'text':
        return TextMessage.fromJson(_message);
    }
  }
  return _message;

  // Text
  // Image
  // Video
  // Audio
  // File
  // Location
  // Sticker
}
