// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webhook_event_objects.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Source _$SourceFromJson(Map<String, dynamic> json) {
  return Source(
    type: json['type'] as String,
    userId: json['userId'] as String,
    groupId: json['groupId'] as String,
    roomId: json['roomId'] as String,
  );
}

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'type': instance.type,
      'userId': instance.userId,
      'groupId': instance.groupId,
      'roomId': instance.roomId,
    };

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

Emojis _$EmojisFromJson(Map<String, dynamic> json) {
  return Emojis(
    index: json['index'] as int,
    length: json['length'] as int,
    productId: json['productId'] as String,
    emojiId: json['emojiId'] as String,
  );
}

Map<String, dynamic> _$EmojisToJson(Emojis instance) => <String, dynamic>{
      'index': instance.index,
      'length': instance.length,
      'productId': instance.productId,
      'emojiId': instance.emojiId,
    };

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    id: json['id'] as String,
    type: json['type'] as String,
    text: json['text'] as String,
    emojis: json['emojis'] == null
        ? null
        : Emojis.fromJson(json['emojis'] as Map<String, dynamic>),
    duration: json['duration'] as int,
    contentProvider: json['contentProvider'] == null
        ? null
        : ContentProvider.fromJson(
            json['contentProvider'] as Map<String, dynamic>),
    fileName: json['fileName'] as String,
    fileSize: json['fileSize'] as int,
    title: json['title'] as String,
    address: json['address'] as String,
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
    packageId: json['packageId'] as String,
    stickerId: json['stickerId'] as String,
    stickerResourceType: json['stickerResourceType'] as String,
    keywords: (json['keywords'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'text': instance.text,
      'emojis': instance.emojis,
      'duration': instance.duration,
      'contentProvider': instance.contentProvider,
      'fileName': instance.fileName,
      'fileSize': instance.fileSize,
      'title': instance.title,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'packageId': instance.packageId,
      'stickerId': instance.stickerId,
      'stickerResourceType': instance.stickerResourceType,
      'keywords': instance.keywords,
    };

Unsend _$UnsendFromJson(Map<String, dynamic> json) {
  return Unsend(
    messageId: json['messageId'] as String,
  );
}

Map<String, dynamic> _$UnsendToJson(Unsend instance) => <String, dynamic>{
      'messageId': instance.messageId,
    };

Joined _$JoinedFromJson(Map<String, dynamic> json) {
  return Joined(
    members: (json['members'] as List)
        ?.map((e) =>
            e == null ? null : Source.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$JoinedToJson(Joined instance) => <String, dynamic>{
      'members': instance.members,
    };

Left _$LeftFromJson(Map<String, dynamic> json) {
  return Left(
    members: (json['members'] as List)
        ?.map((e) =>
            e == null ? null : Source.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LeftToJson(Left instance) => <String, dynamic>{
      'members': instance.members,
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

VideoPlayComplete _$VideoPlayCompleteFromJson(Map<String, dynamic> json) {
  return VideoPlayComplete(
    trackingId: json['trackingId'] as String,
  );
}

Map<String, dynamic> _$VideoPlayCompleteToJson(VideoPlayComplete instance) =>
    <String, dynamic>{
      'trackingId': instance.trackingId,
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

ActionResults _$ActionResultsFromJson(Map<String, dynamic> json) {
  return ActionResults(
    type: json['type'] as String,
    data: json['data'] as String,
  );
}

Map<String, dynamic> _$ActionResultsToJson(ActionResults instance) =>
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
        ?.map((e) => e == null
            ? null
            : ActionResults.fromJson(e as Map<String, dynamic>))
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

Things _$ThingsFromJson(Map<String, dynamic> json) {
  return Things(
    deviceId: json['deviceId'] as String,
    type: json['type'] as String,
    result: json['result'] == null
        ? null
        : Result.fromJson(json['result'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ThingsToJson(Things instance) => <String, dynamic>{
      'deviceId': instance.deviceId,
      'type': instance.type,
      'result': instance.result,
    };

Events _$EventsFromJson(Map<String, dynamic> json) {
  return Events(
    replyToken: json['replyToken'] as String,
    type: json['type'] as String,
    mode: json['mode'] as String,
    timestamp: json['timestamp'] as int,
    source: json['source'] == null
        ? null
        : Source.fromJson(json['source'] as Map<String, dynamic>),
    message: json['message'] == null
        ? null
        : Message.fromJson(json['message'] as Map<String, dynamic>),
    unsend: json['unsend'] == null
        ? null
        : Unsend.fromJson(json['unsend'] as Map<String, dynamic>),
    joined: json['joined'] == null
        ? null
        : Joined.fromJson(json['joined'] as Map<String, dynamic>),
    left: json['left'] == null
        ? null
        : Left.fromJson(json['left'] as Map<String, dynamic>),
    postback: json['postback'] == null
        ? null
        : Postback.fromJson(json['postback'] as Map<String, dynamic>),
    videoPlayComplete: json['videoPlayComplete'] == null
        ? null
        : VideoPlayComplete.fromJson(
            json['videoPlayComplete'] as Map<String, dynamic>),
    beacon: json['beacon'] == null
        ? null
        : Beacon.fromJson(json['beacon'] as Map<String, dynamic>),
    link: json['link'] == null
        ? null
        : Link.fromJson(json['link'] as Map<String, dynamic>),
    things: json['things'] == null
        ? null
        : Things.fromJson(json['things'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EventsToJson(Events instance) => <String, dynamic>{
      'replyToken': instance.replyToken,
      'type': instance.type,
      'mode': instance.mode,
      'timestamp': instance.timestamp,
      'source': instance.source,
      'message': instance.message,
      'unsend': instance.unsend,
      'joined': instance.joined,
      'left': instance.left,
      'postback': instance.postback,
      'videoPlayComplete': instance.videoPlayComplete,
      'beacon': instance.beacon,
      'link': instance.link,
      'things': instance.things,
    };

WebhookEventObjects _$WebhookEventObjectsFromJson(Map<String, dynamic> json) {
  return WebhookEventObjects(
    destination: json['destination'] as String,
    events: (json['events'] as List)
        ?.map((e) =>
            e == null ? null : Events.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$WebhookEventObjectsToJson(
        WebhookEventObjects instance) =>
    <String, dynamic>{
      'destination': instance.destination,
      'events': instance.events,
    };
