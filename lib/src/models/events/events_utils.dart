part of 'webhook_event.dart';

List<dynamic> _EventInstance(List events) {
  var _events = <dynamic>[];
  events.forEach((event) {
    var _event = Map<String, dynamic>.from(event);
    if (_event.containsKey('type')) {
      switch (_event['type']) {
        case 'message':
          _events.add(MessageEvent.fromJson(_event));
          break;
        case 'follow':
          _events.add(FollowEvent.fromJson(_event));
          break;
        case 'unfollow':
          _events.add(UnfollowEvent.fromJson(_event));
          break;
        case 'join':
          _events.add(JoinEvent.fromJson(_event));
          break;
        case 'leave':
          _events.add(LeaveEvent.fromJson(_event));
          break;
        case 'postback':
          _events.add(PostbackEvent.fromJson(_event));
          break;
        case 'beacon':
          _events.add(BeaconEvent.fromJson(_event));
          break;
        case 'accountLink':
          _events.add(AccountLinkEvent.fromJson(_event));
          break;
        case 'memberJoined':
          _events.add(MemberJoinedEvent.fromJson(_event));
          break;
        case 'memberLeft':
          _events.add(MemberLeftEvent.fromJson(_event));
          break;
        case 'things':
          _events.add(ThingsEvent.fromJson(_event));
          break;
        case 'unsend':
          _events.add(UnsendEvent.fromJson(_event));
          break;
        case 'videoPlayComplete':
          _events.add(VideoPlayCompleteEvent.fromJson(_event));
          break;
      }
    }
  });
  // LOGGER.warn('Unknown event type. type=' + event_type)
  return _events;
}

List<dynamic> _ListSourceInstance(List<dynamic> members) {
  var _members = <dynamic>[];

  members.forEach((member) {
    _members.add(_SourceInstance(Map<String, dynamic>.from(member)));
  });
  return _members;
}

dynamic _SourceInstance(Map<String, dynamic> source) {
  var _source = Map<String, dynamic>.from(source);
  if (_source.containsKey('type')) {
    switch (_source['type']) {
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
    switch (_message['type']) {
      case 'text':
        return TextMessage.fromJson(_message);
      case 'image':
        return ImageMessage.fromJson(_message);
      case 'video':
        return VideoMessage.fromJson(_message);
      case 'audio':
        return AudioMessage.fromJson(_message);
      case 'file':
        return FileMessage.fromJson(_message);
      case 'location':
        return LocationMessage.fromJson(_message);
      case 'sticker':
        return StickerMessage.fromJson(_message);
    }
  }
  return _message;
}

dynamic _ThingsInstance(Map<String, dynamic> things) {
  var _things = Map<String, dynamic>.from(things);
  if (_things.containsKey('type')) {
    switch (_things['type']) {
      case 'link':
        return DeviceLink.fromJson(_things);
      case 'unlink':
        return DeviceUnlink.fromJson(_things);
      case 'scenarioResult':
        return ScenarioResult.fromJson(_things);
    }
  }
  return _things;
}
