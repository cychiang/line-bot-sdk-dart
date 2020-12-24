import 'dart:io';

import 'package:line_bot_sdk_dart/linebot.dart';
import 'package:test/test.dart';

void main() {
  group('Test SignatureValidator', () {
    SignatureValidator signatureValidator;
    WebhookParser webhookParser;
    WebhookEvent webhookEventObjects;
    String body;
    setUp(() async {
      body = await File('${Directory.current.path}/test/text/webhook.json')
          .readAsStringSync();
      signatureValidator = SignatureValidator('channel_secret', false);
      webhookParser = WebhookParser('channel_secret', skipValidator: true);
      webhookEventObjects = webhookParser.parser(body, 'channel_secret');
    });
    test('Validate Signature...', () {
      expect(
          signatureValidator.validate('bodybodybodybody',
              '/gg9a+LvFevTH1sd7XCQycD7tsWclCsInj7MhBHxN7k='),
          isTrue);
    });
    test('Invalidate Signature...', () {
      expect(
          signatureValidator.validate('bodybodybodybody', 'invalid_signature'),
          isFalse);
    });
    test('MessageEvent, SourceUser, TextMessage...', () {
      expect(webhookEventObjects.events[0], isA<MessageEvent>());
      expect(webhookEventObjects.events[0].replyToken,
          'nHuyWiB7yP5Zw52FIkcQobQuGDXCTA');
      expect(webhookEventObjects.events[0].type, 'message');
      expect(webhookEventObjects.events[0].mode, 'active');
      expect(webhookEventObjects.events[0].timestamp, 1462629479859);

      expect(webhookEventObjects.events[0].source, isA<SourceUser>());
      expect(webhookEventObjects.events[0].source.type, 'user');
      expect(webhookEventObjects.events[0].source.userId,
          'U206d25c2ea6bd87c17655609a1c37cb8');
      expect(webhookEventObjects.events[0].message, isA<TextMessage>());
      expect(webhookEventObjects.events[0].message.id, '325708');
      expect(webhookEventObjects.events[0].message.type, 'text');
      expect(webhookEventObjects.events[0].message.text, 'Hello, world');
    });
    test('MessageEvent, SourceRoom, TextMessage', () {
      expect(webhookEventObjects.events[1], isA<MessageEvent>());
      expect(webhookEventObjects.events[1].replyToken,
          'nHuyWiB7yP5Zw52FIkcQobQuGDXCTA');
      expect(webhookEventObjects.events[1].type, 'message');
      expect(webhookEventObjects.events[1].mode, 'active');
      expect(webhookEventObjects.events[1].timestamp, 1462629479859);

      expect(webhookEventObjects.events[1].source, isA<SourceRoom>());
      expect(webhookEventObjects.events[1].source.type, 'room');
      expect(webhookEventObjects.events[1].source.roomId,
          'Ra8dbf4673c4c812cd491258042226c99');
      expect(webhookEventObjects.events[1].source.userId, isNull);

      expect(webhookEventObjects.events[1].message, isA<ImageMessage>());
      expect(webhookEventObjects.events[1].message.id, '325708');
      expect(webhookEventObjects.events[1].message.type, 'image');
      expect(webhookEventObjects.events[1].message.contentProvider.type,
          'external');
      expect(
          webhookEventObjects
              .events[1].message.contentProvider.originalContentUrl,
          'https://example.com');
      expect(
          webhookEventObjects.events[1].message.contentProvider.previewImageUrl,
          'https://example.com');
    });
    test('MessageEvent, SourceUser, VideoMessage', () {
      expect(webhookEventObjects.events[2], isA<MessageEvent>());
      expect(webhookEventObjects.events[2].replyToken,
          'nHuyWiB7yP5Zw52FIkcQobQuGDXCTA');
      expect(webhookEventObjects.events[2].type, 'message');
      expect(webhookEventObjects.events[2].mode, 'active');
      expect(webhookEventObjects.events[2].timestamp, 1462629479859);

      expect(webhookEventObjects.events[2].source, isA<SourceUser>());
      expect(webhookEventObjects.events[2].source.type, 'user');
      expect(webhookEventObjects.events[2].source.userId,
          'U206d25c2ea6bd87c17655609a1c37cb8');

      expect(webhookEventObjects.events[2].message, isA<VideoMessage>());
      expect(webhookEventObjects.events[2].message.id, '325708');
      expect(webhookEventObjects.events[2].message.type, 'video');
      expect(webhookEventObjects.events[2].message.duration, 60000);
      expect(webhookEventObjects.events[2].message.contentProvider.type,
          'external');
      expect(
          webhookEventObjects
              .events[2].message.contentProvider.originalContentUrl,
          'https://example.com');
      expect(
          webhookEventObjects.events[2].message.contentProvider.previewImageUrl,
          'https://example.com');
    });
    test('MessageEvent, SourceUser, AudioMessage', () {
      expect(webhookEventObjects.events[3], isA<MessageEvent>());
      expect(webhookEventObjects.events[3].replyToken,
          'nHuyWiB7yP5Zw52FIkcQobQuGDXCTA');
      expect(webhookEventObjects.events[3].type, 'message');
      expect(webhookEventObjects.events[3].mode, 'active');
      expect(webhookEventObjects.events[3].timestamp, 1462629479859);

      expect(webhookEventObjects.events[3].source, isA<SourceUser>());
      expect(webhookEventObjects.events[3].source.type, 'user');
      expect(webhookEventObjects.events[3].source.userId,
          'U206d25c2ea6bd87c17655609a1c37cb8');

      expect(webhookEventObjects.events[3].message, isA<AudioMessage>());
      expect(webhookEventObjects.events[3].message.id, '325708');
      expect(webhookEventObjects.events[3].message.type, 'audio');
      expect(webhookEventObjects.events[3].message.duration, 60000);
      expect(webhookEventObjects.events[3].message.contentProvider.type,
          'external');
      expect(
          webhookEventObjects
              .events[3].message.contentProvider.originalContentUrl,
          'https://example.com');
    });
    test('MessageEvent, SourceUser, LocationMessage', () {
      expect(webhookEventObjects.events[4], isA<MessageEvent>());
      expect(webhookEventObjects.events[4].replyToken,
          'nHuyWiB7yP5Zw52FIkcQobQuGDXCTA');
      expect(webhookEventObjects.events[4].type, 'message');
      expect(webhookEventObjects.events[4].mode, 'active');
      expect(webhookEventObjects.events[4].timestamp, 1462629479859);

      expect(webhookEventObjects.events[4].source, isA<SourceUser>());
      expect(webhookEventObjects.events[4].source.type, 'user');
      expect(webhookEventObjects.events[4].source.userId,
          'U206d25c2ea6bd87c17655609a1c37cb8');

      expect(webhookEventObjects.events[4].message, isA<LocationMessage>());
      expect(webhookEventObjects.events[4].message.id, '325708');
      expect(webhookEventObjects.events[4].message.type, 'location');
      expect(webhookEventObjects.events[4].message.title, 'my location');
      expect(webhookEventObjects.events[4].message.address, 'Tokyo');
      expect(webhookEventObjects.events[4].message.latitude, 35.65910807942215);
      expect(
          webhookEventObjects.events[4].message.longitude, 139.70372892916203);
    });
    test('MessageEvent, SourceUser, StickerMessage', () {
      expect(webhookEventObjects.events[5], isA<MessageEvent>());
      expect(webhookEventObjects.events[5].replyToken,
          'nHuyWiB7yP5Zw52FIkcQobQuGDXCTA');
      expect(webhookEventObjects.events[5].type, 'message');
      expect(webhookEventObjects.events[5].mode, 'active');
      expect(webhookEventObjects.events[5].timestamp, 1462629479859);

      expect(webhookEventObjects.events[5].source, isA<SourceUser>());
      expect(webhookEventObjects.events[5].source.type, 'user');
      expect(webhookEventObjects.events[5].source.userId,
          'U206d25c2ea6bd87c17655609a1c37cb8');

      expect(webhookEventObjects.events[5].message, isA<StickerMessage>());
      expect(webhookEventObjects.events[5].message.id, '325708');
      expect(webhookEventObjects.events[5].message.type, 'sticker');
      expect(webhookEventObjects.events[5].message.packageId, '1');
      expect(webhookEventObjects.events[5].message.stickerId, '1');
      expect(
          webhookEventObjects.events[5].message.stickerResourceType, 'STATIC');
      expect(webhookEventObjects.events[5].message.keywords[0], 'Love You');
      expect(webhookEventObjects.events[5].message.keywords[1], 'Love');
    });
    test('FollowEvent, SourceUser', () {
      expect(webhookEventObjects.events[6], isA<FollowEvent>());
      expect(webhookEventObjects.events[6].replyToken,
          'nHuyWiB7yP5Zw52FIkcQobQuGDXCTA');
      expect(webhookEventObjects.events[6].type, 'follow');
      expect(webhookEventObjects.events[6].mode, 'active');
      expect(webhookEventObjects.events[6].timestamp, 1462629479859);

      expect(webhookEventObjects.events[6].source, isA<SourceUser>());
      expect(webhookEventObjects.events[6].source.type, 'user');
      expect(webhookEventObjects.events[6].source.userId,
          'U206d25c2ea6bd87c17655609a1c37cb8');
    });
    test('UnfollowEvent, SourceUser', () {
      expect(webhookEventObjects.events[7], isA<UnfollowEvent>());
      expect(webhookEventObjects.events[7].type, 'unfollow');
      expect(webhookEventObjects.events[7].mode, 'active');
      expect(webhookEventObjects.events[7].timestamp, 1462629479859);

      expect(webhookEventObjects.events[7].source, isA<SourceUser>());
      expect(webhookEventObjects.events[7].source.type, 'user');
      expect(webhookEventObjects.events[7].source.userId,
          'U206d25c2ea6bd87c17655609a1c37cb8');
    });
    test('JoinEvent, SourceGroup', () {
      expect(webhookEventObjects.events[8], isA<JoinEvent>());
      expect(webhookEventObjects.events[8].replyToken,
          'nHuyWiB7yP5Zw52FIkcQobQuGDXCTA');
      expect(webhookEventObjects.events[8].type, 'join');
      expect(webhookEventObjects.events[8].mode, 'active');
      expect(webhookEventObjects.events[8].timestamp, 1462629479859);

      expect(webhookEventObjects.events[8].source, isA<SourceGroup>());
      expect(webhookEventObjects.events[8].source.type, 'group');
      expect(webhookEventObjects.events[8].source.groupId,
          'Ca56f94637cc4347f90a25382909b24b9');
      expect(webhookEventObjects.events[8].source.userId, isNull);
    });
    test('LeaveEvent, SourceGroup', () {
      expect(webhookEventObjects.events[9], isA<LeaveEvent>());
      expect(webhookEventObjects.events[9].type, 'leave');
      expect(webhookEventObjects.events[9].mode, 'active');
      expect(webhookEventObjects.events[9].timestamp, 1462629479859);

      expect(webhookEventObjects.events[9].source, isA<SourceGroup>());
      expect(webhookEventObjects.events[9].source.type, 'group');
      expect(webhookEventObjects.events[9].source.groupId,
          'Ca56f94637cc4347f90a25382909b24b9');
      expect(webhookEventObjects.events[9].source.userId, isNull);
    });
    test('PostbackEvent, SourceUser', () {
      expect(webhookEventObjects.events[10], isA<PostbackEvent>());
      expect(webhookEventObjects.events[10].replyToken,
          'nHuyWiB7yP5Zw52FIkcQobQuGDXCTA');
      expect(webhookEventObjects.events[10].type, 'postback');
      expect(webhookEventObjects.events[10].mode, 'active');
      expect(webhookEventObjects.events[10].timestamp, 1462629479859);

      expect(webhookEventObjects.events[10].source, isA<SourceUser>());
      expect(webhookEventObjects.events[10].source.type, 'user');
      expect(webhookEventObjects.events[10].source.userId,
          'U206d25c2ea6bd87c17655609a1c37cb8');
      expect(webhookEventObjects.events[10].postback.data,
          'action=buyItem&itemId=123123&color=red');
      expect(webhookEventObjects.events[10].postback.params, isNull);
    });
    test('BeaconEvent, SourceUser', () {
      expect(webhookEventObjects.events[11], isA<BeaconEvent>());
      expect(webhookEventObjects.events[11].replyToken,
          'nHuyWiB7yP5Zw52FIkcQobQuGDXCTA');
      expect(webhookEventObjects.events[11].type, 'beacon');
      expect(webhookEventObjects.events[11].mode, 'active');
      expect(webhookEventObjects.events[11].timestamp, 1462629479859);

      expect(webhookEventObjects.events[11].source, isA<SourceUser>());
      expect(webhookEventObjects.events[11].source.type, 'user');
      expect(webhookEventObjects.events[11].source.userId,
          'U206d25c2ea6bd87c17655609a1c37cb8');

      expect(webhookEventObjects.events[11].beacon.hwid, 'd41d8cd98f');
      expect(webhookEventObjects.events[11].beacon.type, 'enter');
      expect(webhookEventObjects.events[11].beacon.dm, isNull);
    });
    test('BeaconEvent, SourceUser (with device message)', () {
      expect(webhookEventObjects.events[12], isA<BeaconEvent>());
      expect(webhookEventObjects.events[12].replyToken,
          'nHuyWiB7yP5Zw52FIkcQobQuGDXCTA');
      expect(webhookEventObjects.events[12].type, 'beacon');
      expect(webhookEventObjects.events[12].mode, 'active');
      expect(webhookEventObjects.events[12].timestamp, 1462629479859);

      expect(webhookEventObjects.events[12].source, isA<SourceUser>());
      expect(webhookEventObjects.events[12].source.type, 'user');
      expect(webhookEventObjects.events[12].source.userId,
          'U206d25c2ea6bd87c17655609a1c37cb8');

      expect(webhookEventObjects.events[12].beacon.hwid, 'd41d8cd98f');
      expect(webhookEventObjects.events[12].beacon.type, 'enter');
      expect(webhookEventObjects.events[12].beacon.dm, '1234567890abcdef');
      // convert dm to byte array.
    });
    test('AccountLinkEvent, SourceUser', () {
      expect(webhookEventObjects.events[13], isA<AccountLinkEvent>());
      expect(webhookEventObjects.events[13].replyToken,
          'nHuyWiB7yP5Zw52FIkcQobQuGDXCTA');
      expect(webhookEventObjects.events[13].type, 'accountLink');
      expect(webhookEventObjects.events[13].mode, 'active');
      expect(webhookEventObjects.events[13].timestamp, 1462629479859);

      expect(webhookEventObjects.events[13].source, isA<SourceUser>());
      expect(webhookEventObjects.events[13].source.type, 'user');
      expect(webhookEventObjects.events[13].source.userId,
          'U206d25c2ea6bd87c17655609a1c37cb8');

      expect(webhookEventObjects.events[13].link.result, 'ok');
      expect(
          webhookEventObjects.events[13].link.nonce, 'Vb771wDYtXuammLszK6h9A');
    });
    test('MessageEvent, SourceGroup with userId, TextMessage', () {
      expect(webhookEventObjects.events[14], isA<MessageEvent>());
      expect(webhookEventObjects.events[14].replyToken,
          'nHuyWiB7yP5Zw52FIkcQobQuGDXCTA');
      expect(webhookEventObjects.events[14].type, 'message');
      expect(webhookEventObjects.events[14].mode, 'active');
      expect(webhookEventObjects.events[14].timestamp, 1462629479859);

      expect(webhookEventObjects.events[14].source, isA<SourceGroup>());
      expect(webhookEventObjects.events[14].source.type, 'group');
      expect(webhookEventObjects.events[14].source.groupId,
          'Ca56f94637cc4347f90a25382909b24b9');
      expect(webhookEventObjects.events[14].source.userId,
          'U206d25c2ea6bd87c17655609a1c37cb8');

      expect(webhookEventObjects.events[14].message, isA<TextMessage>());
      expect(webhookEventObjects.events[14].message.id, '325708');
      expect(webhookEventObjects.events[14].message.type, 'text');
      expect(webhookEventObjects.events[14].message.text, 'Hello, world');
    });
    test('MessageEvent, SourceRoom with userId, TextMessage', () {
      expect(webhookEventObjects.events[15], isA<MessageEvent>());
      expect(webhookEventObjects.events[15].replyToken,
          'nHuyWiB7yP5Zw52FIkcQobQuGDXCTA');
      expect(webhookEventObjects.events[15].type, 'message');
      expect(webhookEventObjects.events[15].mode, 'active');
      expect(webhookEventObjects.events[15].timestamp, 1462629479859);

      expect(webhookEventObjects.events[15].source, isA<SourceRoom>());
      expect(webhookEventObjects.events[15].source.type, 'room');
      expect(webhookEventObjects.events[15].source.roomId,
          'Ra8dbf4673c4c812cd491258042226c99');
      expect(webhookEventObjects.events[15].source.userId,
          'U206d25c2ea6bd87c17655609a1c37cb8');

      expect(webhookEventObjects.events[15].message, isA<TextMessage>());
      expect(webhookEventObjects.events[15].message.id, '325708');
      expect(webhookEventObjects.events[15].message.type, 'text');
      expect(webhookEventObjects.events[15].message.text, 'Hello, world');
    });
    test('PostbackEvent, SourceUser, with date params', () {
      expect(webhookEventObjects.events[16], isA<PostbackEvent>());
      expect(webhookEventObjects.events[16].replyToken,
          'nHuyWiB7yP5Zw52FIkcQobQuGDXCTA');
      expect(webhookEventObjects.events[16].type, 'postback');
      expect(webhookEventObjects.events[16].mode, 'active');
      expect(webhookEventObjects.events[16].timestamp, 1462629479859);

      expect(webhookEventObjects.events[16].source, isA<SourceUser>());
      expect(webhookEventObjects.events[16].source.type, 'user');
      expect(webhookEventObjects.events[16].source.userId,
          'U206d25c2ea6bd87c17655609a1c37cb8');

      expect(webhookEventObjects.events[16].postback.data,
          'action=buyItem&itemId=123123&color=red');
      expect(webhookEventObjects.events[16].postback.params.date, '2013-04-01');
    });
    test('PostbackEvent, SourceUser, with date params', () {
      expect(webhookEventObjects.events[17], isA<PostbackEvent>());
      expect(webhookEventObjects.events[17].replyToken,
          'nHuyWiB7yP5Zw52FIkcQobQuGDXCTA');
      expect(webhookEventObjects.events[17].type, 'postback');
      expect(webhookEventObjects.events[17].mode, 'active');
      expect(webhookEventObjects.events[17].timestamp, 1462629479859);

      expect(webhookEventObjects.events[17].source, isA<SourceUser>());
      expect(webhookEventObjects.events[17].source.type, 'user');
      expect(webhookEventObjects.events[17].source.userId,
          'U206d25c2ea6bd87c17655609a1c37cb8');

      expect(webhookEventObjects.events[17].postback.data,
          'action=buyItem&itemId=123123&color=red');
      expect(webhookEventObjects.events[17].postback.params.time, '10:00');
    });
    test('PostbackEvent, SourceUser, with date params', () {
      expect(webhookEventObjects.events[18], isA<PostbackEvent>());
      expect(webhookEventObjects.events[18].replyToken,
          'nHuyWiB7yP5Zw52FIkcQobQuGDXCTA');
      expect(webhookEventObjects.events[18].type, 'postback');
      expect(webhookEventObjects.events[18].mode, 'active');
      expect(webhookEventObjects.events[18].timestamp, 1462629479859);

      expect(webhookEventObjects.events[18].source, isA<SourceUser>());
      expect(webhookEventObjects.events[18].source.type, 'user');
      expect(webhookEventObjects.events[18].source.userId,
          'U206d25c2ea6bd87c17655609a1c37cb8');

      expect(webhookEventObjects.events[18].postback.data,
          'action=buyItem&itemId=123123&color=red');
      expect(webhookEventObjects.events[18].postback.params.datetime,
          '2013-04-01T10:00');
    });
    test('ThingsEvent, SourceUser, link', () {
      expect(webhookEventObjects.events[19], isA<ThingsEvent>());
      expect(webhookEventObjects.events[19].replyToken,
          'nHuyWiB7yP5Zw52FIkcQobQuGDXCTA');
      expect(webhookEventObjects.events[19].type, 'things');
      expect(webhookEventObjects.events[19].mode, 'active');
      expect(webhookEventObjects.events[19].timestamp, 1462629479859);

      expect(webhookEventObjects.events[19].source, isA<SourceUser>());
      expect(webhookEventObjects.events[19].source.type, 'user');
      expect(webhookEventObjects.events[19].source.userId,
          'U206d25c2ea6bd87c17655609a1c37cb8');

      expect(webhookEventObjects.events[19].things, isA<DeviceLink>());
      expect(webhookEventObjects.events[19].things.type, 'link');
      expect(webhookEventObjects.events[19].things.deviceId, 't2c449c9d1');
    });
    test('MemberJoinedEvent', () {
      expect(webhookEventObjects.events[20], isA<MemberJoinedEvent>());
      expect(webhookEventObjects.events[20].replyToken,
          '0f3779fba3b349968c5d07db31eabf65');
      expect(webhookEventObjects.events[20].type, 'memberJoined');
      expect(webhookEventObjects.events[20].mode, 'active');
      expect(webhookEventObjects.events[20].timestamp, 1462629479859);

      expect(webhookEventObjects.events[20].source, isA<SourceGroup>());
      expect(webhookEventObjects.events[20].source.type, 'group');
      expect(webhookEventObjects.events[20].source.groupId, 'C4af4980629...');

      expect(webhookEventObjects.events[20].joined.members.length, 2);
      expect(
          webhookEventObjects.events[20].joined.members[0], isA<SourceUser>());
      expect(webhookEventObjects.events[20].joined.members[0].userId,
          'U4af4980629...');
      expect(webhookEventObjects.events[20].joined.members[1].userId,
          'U91eeaf62d9...');
    });
    test('MemberLeftEvent', () {
      expect(webhookEventObjects.events[21], isA<MemberLeftEvent>());
      expect(webhookEventObjects.events[21].type, 'memberLeft');
      expect(webhookEventObjects.events[21].mode, 'active');
      expect(webhookEventObjects.events[21].timestamp, 1462629479960);

      expect(webhookEventObjects.events[21].source, isA<SourceGroup>());
      expect(webhookEventObjects.events[21].source.type, 'group');
      expect(webhookEventObjects.events[21].source.groupId, 'C4af4980629...');

      expect(webhookEventObjects.events[21].left.members.length, 2);
      expect(webhookEventObjects.events[21].left.members[0], isA<SourceUser>());
      expect(webhookEventObjects.events[21].left.members[0].userId,
          'U4af4980629...');
      expect(webhookEventObjects.events[21].left.members[1].userId,
          'U91eeaf62d9...');
    });
    test('ThingsEvent, SourceUser, unlink', () {
      expect(webhookEventObjects.events[22], isA<ThingsEvent>());
      expect(webhookEventObjects.events[22].replyToken,
          'nHuyWiB7yP5Zw52FIkcQobQuGDXCTA');
      expect(webhookEventObjects.events[22].type, 'things');
      expect(webhookEventObjects.events[22].mode, 'active');
      expect(webhookEventObjects.events[22].timestamp, 1462629479859);

      expect(webhookEventObjects.events[22].source, isA<SourceUser>());
      expect(webhookEventObjects.events[22].source.type, 'user');
      expect(webhookEventObjects.events[22].source.userId,
          'U206d25c2ea6bd87c17655609a1c37cb8');

      expect(webhookEventObjects.events[22].things, isA<DeviceUnlink>());
      expect(webhookEventObjects.events[22].things.type, 'unlink');
      expect(webhookEventObjects.events[22].things.deviceId, 't2c449c9d1');
    });
    test('MessageEvent, SourceUser, FileMessage', () {
      expect(webhookEventObjects.events[23], isA<MessageEvent>());
      expect(webhookEventObjects.events[23].replyToken,
          'nHuyWiB7yP5Zw52FIkcQobQuGDXCTA');
      expect(webhookEventObjects.events[23].type, 'message');
      expect(webhookEventObjects.events[23].mode, 'active');
      expect(webhookEventObjects.events[23].timestamp, 1462629479859);

      expect(webhookEventObjects.events[23].source, isA<SourceUser>());
      expect(webhookEventObjects.events[23].source.type, 'user');
      expect(webhookEventObjects.events[23].source.userId,
          'U206d25c2ea6bd87c17655609a1c37cb8');

      expect(webhookEventObjects.events[23].message, isA<FileMessage>());
      expect(webhookEventObjects.events[23].message.id, '325708');
      expect(webhookEventObjects.events[23].message.type, 'file');
      expect(webhookEventObjects.events[23].message.fileName, 'file.txt');
      expect(webhookEventObjects.events[23].message.fileSize, 2138);
    });
    test('ThingsEvent, SourceUser, scenarioResult', () {
      expect(webhookEventObjects.events[24], isA<ThingsEvent>());
      expect(webhookEventObjects.events[24].replyToken,
          'nHuyWiB7yP5Zw52FIkcQobQuGDXCTA');
      expect(webhookEventObjects.events[24].type, 'things');
      expect(webhookEventObjects.events[24].mode, 'active');
      expect(webhookEventObjects.events[24].timestamp, 1547817848122);

      expect(webhookEventObjects.events[24].source, isA<SourceUser>());
      expect(webhookEventObjects.events[24].source.type, 'user');
      expect(webhookEventObjects.events[24].source.userId,
          'U206d25c2ea6bd87c17655609a1c37cb8');

      expect(webhookEventObjects.events[24].things, isA<ScenarioResult>());
      expect(webhookEventObjects.events[24].things.type, 'scenarioResult');
      expect(webhookEventObjects.events[24].things.deviceId, 't2c449c9d1');
      expect(webhookEventObjects.events[24].things.result.scenarioId, 'XXX');
      expect(webhookEventObjects.events[24].things.result.revision, 2);
      expect(webhookEventObjects.events[24].things.result.startTime,
          1547817845950);
      expect(
          webhookEventObjects.events[24].things.result.endTime, 1547817845952);
      expect(
          webhookEventObjects.events[24].things.result.resultCode, 'success');
      expect(
          webhookEventObjects.events[24].things.result.bleNotificationPayload,
          'AQ==');
      expect(webhookEventObjects.events[24].things.result.actionResults[0].type,
          'binary');
      expect(webhookEventObjects.events[24].things.result.actionResults[0].data,
          '/w==');
      expect(webhookEventObjects.events[24].things.result.actionResults[1].type,
          'void');
    });
    test('UnsendEvent', () {
      expect(webhookEventObjects.events[25], isA<UnsendEvent>());
      expect(webhookEventObjects.events[25].type, 'unsend');
      expect(webhookEventObjects.events[25].mode, 'active');
      expect(webhookEventObjects.events[25].timestamp, 1547817848122);

      expect(webhookEventObjects.events[25].source, isA<SourceGroup>());
      expect(webhookEventObjects.events[25].source.type, 'group');
      expect(webhookEventObjects.events[25].source.userId,
          'U206d25c2ea6bd87c17655609a1c37cb8');

      expect(webhookEventObjects.events[25].unsend, isA<Unsend>());
      expect(webhookEventObjects.events[25].unsend.messageId, '325708');
    });
    test('VideoPlayCompleteEvent', () {
      expect(webhookEventObjects.events[26], isA<VideoPlayCompleteEvent>());
      expect(webhookEventObjects.events[26].replyToken,
          'nHuyWiB7yP5Zw52FIkcQobQuGDXCTA');
      expect(webhookEventObjects.events[26].type, 'videoPlayComplete');
      expect(webhookEventObjects.events[26].mode, 'active');
      expect(webhookEventObjects.events[26].timestamp, 1462629479859);

      expect(webhookEventObjects.events[26].source, isA<SourceUser>());
      expect(webhookEventObjects.events[26].source.type, 'user');
      expect(webhookEventObjects.events[26].source.userId,
          'U206d25c2ea6bd87c17655609a1c37cb8');

      expect(webhookEventObjects.events[26].videoPlayComplete,
          isA<VideoPlayComplete>());
      expect(webhookEventObjects.events[26].videoPlayComplete.trackingId,
          'track_id');
    });
  });
}
