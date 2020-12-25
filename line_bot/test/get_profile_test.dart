import 'dart:convert';

import 'package:mock_web_server/mock_web_server.dart';
import 'package:line_bot/line_bot.dart';
import 'package:test/test.dart';

void main() {

  group('Test getProfile', () {
    MockWebServer server;
    LineBotApi lineBotApi;
    setUp(() async {
      server = new MockWebServer();
      server.start();
    });
    tearDown((){
      server.shutdown();
    });
    test('getProfile...', () async {
      server.enqueue(
          body: jsonEncode({
            'displayName': 'LINE taro',
            'userId': 'U4af4980629',
            'language': 'en',
            'pictureUrl':'https://obs.line-apps.com/...',
            'statusMessage': 'Hello, LINE!'
          }));
      lineBotApi = LineBotApi('channel_secret',
          endpoint: '${server.url}');
      var profile = await lineBotApi.getProfile('U4af4980629');
      expect(profile.displayName, 'LINE taro');
      expect(profile.userId, 'U4af4980629');
      expect(profile.language, 'en');
      expect(profile.pictureUrl, 'https://obs.line-apps.com/...');
      expect(profile.statusMessage, 'Hello, LINE!');
    });
  });
}