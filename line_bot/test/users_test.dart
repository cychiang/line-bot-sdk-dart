import 'dart:convert';
import 'dart:io';

import 'package:line_bot/line_bot.dart';
import 'package:mock_web_server/mock_web_server.dart';
import 'package:test/test.dart';

void main() {
  group('Test getProfile', () {
    MockWebServer server;
    var dispatcher = (HttpRequest request) async {
      if (request.uri.path == '/v2/bot/followers/ids' &&
          request.uri.query.isEmpty) {
        return MockResponse()
          ..httpCode = HttpStatus.ok
          ..body = jsonEncode({
            'userIds': ['123', '456', '789'],
            'next': 'jsadhgf'
          });
      }
      if (request.uri.path == '/v2/bot/profile/U4af4980629') {
        return MockResponse()
          ..httpCode = HttpStatus.ok
          ..body = jsonEncode({
            'displayName': 'LINE taro',
            'userId': 'U4af4980629',
            'language': 'en',
            'pictureUrl': 'https://obs.line-apps.com/...',
            'statusMessage': 'Hello, LINE!'
          });
      }
      if (request.uri.path == '/v2/bot/followers/ids' &&
          request.uri.query == 'start=jsadhgf') {
        return MockResponse()
          ..httpCode = HttpStatus.ok
          ..body = jsonEncode({
            'userIds': ['987', '654', '321']
          });
      }
    };
    setUp(() async {
      server = new MockWebServer();
      server.dispatcher = dispatcher;
      server.start();
    });
    tearDown(() {
      server.shutdown();
    });
    test('getProfile', () async {
      var lineBotApi = LineBotApi('channel_secret',
          endpoint: '${server.url.substring(0, server.url.length - 1)}');
      var profile = await lineBotApi.getProfile('U4af4980629');
      expect(profile.displayName, 'LINE taro');
      expect(profile.userId, 'U4af4980629');
      expect(profile.language, 'en');
      expect(profile.pictureUrl, 'https://obs.line-apps.com/...');
      expect(profile.statusMessage, 'Hello, LINE!');
    });
    test('getFollowers without next token', () async {
      var lineBotApi = LineBotApi('channel_secret',
          endpoint: '${server.url.substring(0, server.url.length - 1)}');
      var followers = await lineBotApi.getFollowers();
      expect(followers.userIds[0], '123');
      expect(followers.userIds[1], '456');
      expect(followers.userIds[2], '789');
    });
    test('getFollowers with next token', () async {
      var lineBotApi = LineBotApi('channel_secret',
          endpoint: '${server.url.substring(0, server.url.length - 1)}');
      var followers = await lineBotApi.getFollowers();
      expect(followers.userIds[0], '123');
      expect(followers.userIds[1], '456');
      expect(followers.userIds[2], '789');
      expect(followers.next, 'jsadhgf');
      followers = await lineBotApi.getFollowers(next: followers.next);
      expect(followers.userIds[0], '987');
      expect(followers.userIds[1], '654');
      expect(followers.userIds[2], '321');
    });
  });
}
