import 'dart:convert';
import 'dart:io';

import 'package:line_bot/line_bot.dart';
import 'package:mock_web_server/mock_web_server.dart';
import 'package:test/test.dart';

Future<MockResponse> _dispatcher(HttpRequest request) async {
  if (request.uri.path == '/v2/bot/info' && request.uri.query.isEmpty) {
    return MockResponse()
      ..httpCode = HttpStatus.ok
      ..body = jsonEncode({
        'userId': 'Ub9952f8',
        'basicId': '@216ru',
        'displayName': 'Example name',
        'pictureUrl': 'https://obs.line-apps.com',
        'chatMode': 'chat',
        'markAsReadMode': 'manual'
      });
  }
  return MockResponse()..httpCode = HttpStatus.ok;
}

void main() {
  group('Test get bot info', () {
    LineBotApi lineBotApi;
    MockWebServer server;
    setUp(() async {
      server = new MockWebServer();
      server.dispatcher = _dispatcher;
      await server.start();
      lineBotApi = LineBotApi('channel_secret',
          endpoint: '${server.url.substring(0, server.url.length - 1)}');
    });
    tearDown(() {
      server.shutdown();
    });
    test('getBotInfo', () async {
      var botInfo = await lineBotApi.getBotInfo();
      expect(botInfo.userId, 'Ub9952f8');
      expect(botInfo.basicId, '@216ru');
      expect(botInfo.displayName, 'Example name');
      expect(botInfo.pictureUrl, 'https://obs.line-apps.com');
      expect(botInfo.chatMode, 'chat');
      expect(botInfo.markAsReadMode, 'manual');
    });
  });
}
