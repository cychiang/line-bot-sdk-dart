// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Link _$LinkFromJson(Map<String, dynamic> json) {
  return Link(
    result: json['result'] as String,
    nonce: json['nonce'] as String,
  );
}

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
      'result': instance.result,
      'nonce': instance.nonce,
    };

AccountLinkEvent _$AccountLinkEventFromJson(Map<String, dynamic> json) {
  return AccountLinkEvent(
    replyToken: json['replyToken'] as String,
    type: json['type'] as String,
    mode: json['mode'] as String,
    timestamp: json['timestamp'] as int,
    source: _SourceInstance(json['source'] as Map<String, dynamic>),
    link: json['link'] == null
        ? null
        : Link.fromJson(json['link'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AccountLinkEventToJson(AccountLinkEvent instance) =>
    <String, dynamic>{
      'replyToken': instance.replyToken,
      'type': instance.type,
      'mode': instance.mode,
      'timestamp': instance.timestamp,
      'source': instance.source,
      'link': instance.link,
    };

Beacon _$BeaconFromJson(Map<String, dynamic> json) {
  return Beacon(
    hwid: json['hwid'] as String,
    type: json['type'] as String,
    dm: json['dm'] as String,
  );
}

Map<String, dynamic> _$BeaconToJson(Beacon instance) => <String, dynamic>{
      'hwid': instance.hwid,
      'type': instance.type,
      'dm': instance.dm,
    };

BeaconEvent _$BeaconEventFromJson(Map<String, dynamic> json) {
  return BeaconEvent(
    replyToken: json['replyToken'] as String,
    type: json['type'] as String,
    mode: json['mode'] as String,
    timestamp: json['timestamp'] as int,
    source: _SourceInstance(json['source'] as Map<String, dynamic>),
    beacon: json['beacon'] == null
        ? null
        : Beacon.fromJson(json['beacon'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BeaconEventToJson(BeaconEvent instance) =>
    <String, dynamic>{
      'replyToken': instance.replyToken,
      'type': instance.type,
      'mode': instance.mode,
      'timestamp': instance.timestamp,
      'source': instance.source,
      'beacon': instance.beacon,
    };

Emojis _$EmojisFromJson(Map<String, dynamic> json) {
  return Emojis(
    index: json['index'] as int,
    productId: json['productId'] as String,
    emojiId: json['emojiId'] as String,
  );
}

Map<String, dynamic> _$EmojisToJson(Emojis instance) => <String, dynamic>{
      'index': instance.index,
      'productId': instance.productId,
      'emojiId': instance.emojiId,
    };

TextMessage _$TextMessageFromJson(Map<String, dynamic> json) {
  return TextMessage(
    id: json['id'] as String,
    type: json['type'] as String,
    text: json['text'] as String,
    emojis: (json['emojis'] as List)
        ?.map((e) =>
            e == null ? null : Emojis.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TextMessageToJson(TextMessage instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'text': instance.text,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('emojis', instance.emojis);
  return val;
}

ContentProvider _$ContentProviderFromJson(Map<String, dynamic> json) {
  return ContentProvider(
    type: json['type'] as String,
    originalContentUrl: json['originalContentUrl'] as String,
    previewImageUrl: json['previewImageUrl'] as String,
  );
}

Map<String, dynamic> _$ContentProviderToJson(ContentProvider instance) =>
    <String, dynamic>{
      'type': instance.type,
      'originalContentUrl': instance.originalContentUrl,
      'previewImageUrl': instance.previewImageUrl,
    };

ImageMessage _$ImageMessageFromJson(Map<String, dynamic> json) {
  return ImageMessage(
    id: json['id'] as String,
    type: json['type'] as String,
    contentProvider: json['contentProvider'] == null
        ? null
        : ContentProvider.fromJson(
            json['contentProvider'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ImageMessageToJson(ImageMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'contentProvider': instance.contentProvider,
    };

VideoMessage _$VideoMessageFromJson(Map<String, dynamic> json) {
  return VideoMessage(
    id: json['id'] as String,
    type: json['type'] as String,
    duration: json['duration'] as int,
    contentProvider: json['contentProvider'] == null
        ? null
        : ContentProvider.fromJson(
            json['contentProvider'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VideoMessageToJson(VideoMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'duration': instance.duration,
      'contentProvider': instance.contentProvider,
    };

AudioMessage _$AudioMessageFromJson(Map<String, dynamic> json) {
  return AudioMessage(
    id: json['id'] as String,
    type: json['type'] as String,
    duration: json['duration'] as int,
    contentProvider: json['contentProvider'] == null
        ? null
        : ContentProvider.fromJson(
            json['contentProvider'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AudioMessageToJson(AudioMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'duration': instance.duration,
      'contentProvider': instance.contentProvider,
    };

FileMessage _$FileMessageFromJson(Map<String, dynamic> json) {
  return FileMessage(
    id: json['id'] as String,
    type: json['type'] as String,
    fileName: json['fileName'] as String,
    fileSize: json['fileSize'] as int,
  );
}

Map<String, dynamic> _$FileMessageToJson(FileMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'fileName': instance.fileName,
      'fileSize': instance.fileSize,
    };

LocationMessage _$LocationMessageFromJson(Map<String, dynamic> json) {
  return LocationMessage(
    id: json['id'] as String,
    type: json['type'] as String,
    title: json['title'] as String,
    address: json['address'] as String,
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$LocationMessageToJson(LocationMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

StickerMessage _$StickerMessageFromJson(Map<String, dynamic> json) {
  return StickerMessage(
    id: json['id'] as String,
    type: json['type'] as String,
    packageId: json['packageId'] as String,
    stickerId: json['stickerId'] as String,
    stickerResourceType: json['stickerResourceType'] as String,
    keywords: (json['keywords'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$StickerMessageToJson(StickerMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'packageId': instance.packageId,
      'stickerId': instance.stickerId,
      'stickerResourceType': instance.stickerResourceType,
      'keywords': instance.keywords,
    };

SourceUser _$SourceUserFromJson(Map<String, dynamic> json) {
  return SourceUser(
    type: json['type'] as String,
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$SourceUserToJson(SourceUser instance) =>
    <String, dynamic>{
      'type': instance.type,
      'userId': instance.userId,
    };

SourceGroup _$SourceGroupFromJson(Map<String, dynamic> json) {
  return SourceGroup(
    type: json['type'] as String,
    groupId: json['groupId'] as String,
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$SourceGroupToJson(SourceGroup instance) =>
    <String, dynamic>{
      'type': instance.type,
      'groupId': instance.groupId,
      'userId': instance.userId,
    };

SourceRoom _$SourceRoomFromJson(Map<String, dynamic> json) {
  return SourceRoom(
    type: json['type'] as String,
    roomId: json['roomId'] as String,
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$SourceRoomToJson(SourceRoom instance) =>
    <String, dynamic>{
      'type': instance.type,
      'roomId': instance.roomId,
      'userId': instance.userId,
    };

FollowEvent _$FollowEventFromJson(Map<String, dynamic> json) {
  return FollowEvent(
    replyToken: json['replyToken'] as String,
    type: json['type'] as String,
    mode: json['mode'] as String,
    timestamp: json['timestamp'] as int,
    source: _SourceInstance(json['source'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FollowEventToJson(FollowEvent instance) =>
    <String, dynamic>{
      'replyToken': instance.replyToken,
      'type': instance.type,
      'mode': instance.mode,
      'timestamp': instance.timestamp,
      'source': instance.source,
    };

JoinEvent _$JoinEventFromJson(Map<String, dynamic> json) {
  return JoinEvent(
    replyToken: json['replyToken'] as String,
    type: json['type'] as String,
    mode: json['mode'] as String,
    timestamp: json['timestamp'] as int,
    source: _SourceInstance(json['source'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$JoinEventToJson(JoinEvent instance) => <String, dynamic>{
      'replyToken': instance.replyToken,
      'type': instance.type,
      'mode': instance.mode,
      'timestamp': instance.timestamp,
      'source': instance.source,
    };

LeaveEvent _$LeaveEventFromJson(Map<String, dynamic> json) {
  return LeaveEvent(
    type: json['type'] as String,
    mode: json['mode'] as String,
    timestamp: json['timestamp'] as int,
    source: _SourceInstance(json['source'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LeaveEventToJson(LeaveEvent instance) =>
    <String, dynamic>{
      'type': instance.type,
      'mode': instance.mode,
      'timestamp': instance.timestamp,
      'source': instance.source,
    };

Joined _$JoinedFromJson(Map<String, dynamic> json) {
  return Joined(
    members: _ListSourceInstance(json['members'] as List),
  );
}

Map<String, dynamic> _$JoinedToJson(Joined instance) => <String, dynamic>{
      'members': instance.members,
    };

MemberJoinedEvent _$MemberJoinedEventFromJson(Map<String, dynamic> json) {
  return MemberJoinedEvent(
    replyToken: json['replyToken'] as String,
    type: json['type'] as String,
    mode: json['mode'] as String,
    timestamp: json['timestamp'] as int,
    source: _SourceInstance(json['source'] as Map<String, dynamic>),
    joined: json['joined'] == null
        ? null
        : Joined.fromJson(json['joined'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MemberJoinedEventToJson(MemberJoinedEvent instance) =>
    <String, dynamic>{
      'replyToken': instance.replyToken,
      'type': instance.type,
      'mode': instance.mode,
      'timestamp': instance.timestamp,
      'source': instance.source,
      'joined': instance.joined,
    };

Left _$LeftFromJson(Map<String, dynamic> json) {
  return Left(
    members: _ListSourceInstance(json['members'] as List),
  );
}

Map<String, dynamic> _$LeftToJson(Left instance) => <String, dynamic>{
      'members': instance.members,
    };

MemberLeftEvent _$MemberLeftEventFromJson(Map<String, dynamic> json) {
  return MemberLeftEvent(
    replyToken: json['replyToken'] as String,
    type: json['type'] as String,
    mode: json['mode'] as String,
    timestamp: json['timestamp'] as int,
    source: _SourceInstance(json['source'] as Map<String, dynamic>),
    left: json['left'] == null
        ? null
        : Left.fromJson(json['left'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MemberLeftEventToJson(MemberLeftEvent instance) =>
    <String, dynamic>{
      'replyToken': instance.replyToken,
      'type': instance.type,
      'mode': instance.mode,
      'timestamp': instance.timestamp,
      'source': instance.source,
      'left': instance.left,
    };

MessageEvent _$MessageEventFromJson(Map<String, dynamic> json) {
  return MessageEvent(
    replyToken: json['replyToken'] as String,
    type: json['type'] as String,
    mode: json['mode'] as String,
    timestamp: json['timestamp'] as int,
    source: _SourceInstance(json['source'] as Map<String, dynamic>),
    message: _MessageInstance(json['message'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MessageEventToJson(MessageEvent instance) =>
    <String, dynamic>{
      'replyToken': instance.replyToken,
      'type': instance.type,
      'mode': instance.mode,
      'timestamp': instance.timestamp,
      'source': instance.source,
      'message': instance.message,
    };

Params _$ParamsFromJson(Map<String, dynamic> json) {
  return Params(
    date: json['date'] as String,
    time: json['time'] as String,
    datetime: json['datetime'] as String,
  );
}

Map<String, dynamic> _$ParamsToJson(Params instance) => <String, dynamic>{
      'date': instance.date,
      'time': instance.time,
      'datetime': instance.datetime,
    };

Postback _$PostbackFromJson(Map<String, dynamic> json) {
  return Postback(
    data: json['data'] as String,
    params: json['params'] == null
        ? null
        : Params.fromJson(json['params'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PostbackToJson(Postback instance) => <String, dynamic>{
      'data': instance.data,
      'params': instance.params,
    };

PostbackEvent _$PostbackEventFromJson(Map<String, dynamic> json) {
  return PostbackEvent(
    replyToken: json['replyToken'] as String,
    type: json['type'] as String,
    mode: json['mode'] as String,
    timestamp: json['timestamp'] as int,
    source: _SourceInstance(json['source'] as Map<String, dynamic>),
    postback: json['postback'] == null
        ? null
        : Postback.fromJson(json['postback'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PostbackEventToJson(PostbackEvent instance) =>
    <String, dynamic>{
      'replyToken': instance.replyToken,
      'type': instance.type,
      'mode': instance.mode,
      'timestamp': instance.timestamp,
      'source': instance.source,
      'postback': instance.postback,
    };

ActionResult _$ActionResultFromJson(Map<String, dynamic> json) {
  return ActionResult(
    type: json['type'] as String,
    data: json['data'] as String,
  );
}

Map<String, dynamic> _$ActionResultToJson(ActionResult instance) =>
    <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
    };

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    scenarioId: json['scenarioId'] as String,
    revision: json['revision'] as int,
    startTime: json['startTime'] as int,
    endTime: json['endTime'] as int,
    resultCode: json['resultCode'] as String,
    actionResults: (json['actionResults'] as List)
        ?.map((e) =>
            e == null ? null : ActionResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    bleNotificationPayload: json['bleNotificationPayload'] as String,
    errorReason: json['errorReason'] as String,
  );
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'scenarioId': instance.scenarioId,
      'revision': instance.revision,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'resultCode': instance.resultCode,
      'actionResults': instance.actionResults,
      'bleNotificationPayload': instance.bleNotificationPayload,
      'errorReason': instance.errorReason,
    };

ScenarioResult _$ScenarioResultFromJson(Map<String, dynamic> json) {
  return ScenarioResult(
    deviceId: json['deviceId'] as String,
    type: json['type'] as String,
    result: json['result'] == null
        ? null
        : Result.fromJson(json['result'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ScenarioResultToJson(ScenarioResult instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'type': instance.type,
      'result': instance.result,
    };

DeviceUnlink _$DeviceUnlinkFromJson(Map<String, dynamic> json) {
  return DeviceUnlink(
    deviceId: json['deviceId'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$DeviceUnlinkToJson(DeviceUnlink instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'type': instance.type,
    };

DeviceLink _$DeviceLinkFromJson(Map<String, dynamic> json) {
  return DeviceLink(
    deviceId: json['deviceId'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$DeviceLinkToJson(DeviceLink instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'type': instance.type,
    };

ThingsEvent _$ThingsEventFromJson(Map<String, dynamic> json) {
  return ThingsEvent(
    replyToken: json['replyToken'] as String,
    type: json['type'] as String,
    mode: json['mode'] as String,
    timestamp: json['timestamp'] as int,
    source: _SourceInstance(json['source'] as Map<String, dynamic>),
    things: _ThingsInstance(json['things'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ThingsEventToJson(ThingsEvent instance) =>
    <String, dynamic>{
      'replyToken': instance.replyToken,
      'type': instance.type,
      'mode': instance.mode,
      'timestamp': instance.timestamp,
      'source': instance.source,
      'things': instance.things,
    };

UnfollowEvent _$UnfollowEventFromJson(Map<String, dynamic> json) {
  return UnfollowEvent(
    type: json['type'] as String,
    mode: json['mode'] as String,
    timestamp: json['timestamp'] as int,
    source: _SourceInstance(json['source'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UnfollowEventToJson(UnfollowEvent instance) =>
    <String, dynamic>{
      'type': instance.type,
      'mode': instance.mode,
      'timestamp': instance.timestamp,
      'source': instance.source,
    };

Unsend _$UnsendFromJson(Map<String, dynamic> json) {
  return Unsend(
    messageId: json['messageId'] as String,
  );
}

Map<String, dynamic> _$UnsendToJson(Unsend instance) => <String, dynamic>{
      'messageId': instance.messageId,
    };

UnsendEvent _$UnsendEventFromJson(Map<String, dynamic> json) {
  return UnsendEvent(
    type: json['type'] as String,
    mode: json['mode'] as String,
    timestamp: json['timestamp'] as int,
    source: _SourceInstance(json['source'] as Map<String, dynamic>),
    unsend: json['unsend'] == null
        ? null
        : Unsend.fromJson(json['unsend'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UnsendEventToJson(UnsendEvent instance) =>
    <String, dynamic>{
      'type': instance.type,
      'mode': instance.mode,
      'timestamp': instance.timestamp,
      'source': instance.source,
      'unsend': instance.unsend,
    };

VideoPlayComplete _$VideoPlayCompleteFromJson(Map<String, dynamic> json) {
  return VideoPlayComplete(
    trackingId: json['trackingId'] as String,
  );
}

Map<String, dynamic> _$VideoPlayCompleteToJson(VideoPlayComplete instance) =>
    <String, dynamic>{
      'trackingId': instance.trackingId,
    };

VideoPlayCompleteEvent _$VideoPlayCompleteEventFromJson(
    Map<String, dynamic> json) {
  return VideoPlayCompleteEvent(
    replyToken: json['replyToken'] as String,
    type: json['type'] as String,
    mode: json['mode'] as String,
    timestamp: json['timestamp'] as int,
    source: _SourceInstance(json['source'] as Map<String, dynamic>),
    videoPlayComplete: json['videoPlayComplete'] == null
        ? null
        : VideoPlayComplete.fromJson(
            json['videoPlayComplete'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VideoPlayCompleteEventToJson(
        VideoPlayCompleteEvent instance) =>
    <String, dynamic>{
      'replyToken': instance.replyToken,
      'type': instance.type,
      'mode': instance.mode,
      'timestamp': instance.timestamp,
      'source': instance.source,
      'videoPlayComplete': instance.videoPlayComplete,
    };

WebhookEvent _$WebhookEventFromJson(Map<String, dynamic> json) {
  return WebhookEvent(
    json['destination'] as String,
    _EventInstance(json['events'] as List),
  );
}

Map<String, dynamic> _$WebhookEventToJson(WebhookEvent instance) =>
    <String, dynamic>{
      'destination': instance.destination,
      'events': instance.events,
    };
