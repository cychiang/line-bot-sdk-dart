import 'dart:convert';
import 'dart:io';

import 'package:line_bot/line_bot.dart';
import 'package:mock_web_server/mock_web_server.dart';
import 'package:test/test.dart';

Future<MockResponse> _dispatcher(HttpRequest request) async {
  if (request.uri.path == '/v2/bot/group/Ca56f94637c/summary' && request.uri.query.isEmpty) {
    return MockResponse()
      ..httpCode = HttpStatus.ok
      ..body = jsonEncode({
        'groupId': 'Ca56f94637c',
        'groupName': 'Group name',
        'pictureUrl': 'https://profile.line-scdn.net/abcdefghijklmn'
      });
  }
  return MockResponse()..httpCode = HttpStatus.ok;
}

void main() {
  group('Test get group summary', () {
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
    test('getGroupSummary', () async {
      var groupSummary = await lineBotApi.getGroupSummary('Ca56f94637c');
      expect(groupSummary.groupId, 'Ca56f94637c');
      expect(groupSummary.groupName, 'Group name');
      expect(groupSummary.pictureUrl,
          'https://profile.line-scdn.net/abcdefghijklmn');
    });
  });
}
