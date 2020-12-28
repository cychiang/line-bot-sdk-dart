import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:line_bot/line_bot.dart';
import 'package:line_bot/src/models/group.dart';

class LineBotApi {
  /// Http Status code
  static const httpStatusOk = 200;

  /// Default value for [endpoint], [dataEndpoint] and [timeout] if not set.
  static const defaultApiEndpoint = 'https://api.line.me';
  static const defaultApiDataEndpoint = 'https://api-data.line.me';
  static const defaultTimeout = 30;

  /// The [channelAccessToken] is issued from the LINE Developers console.
  String channelAccessToken;

  /// LINE Messaging API endpoint, assign [defaultApiEndpoint] if null.
  String endpoint;

  /// LINE Messaging API endpoint for content, assign [defaultApiDataEndpoint] if null.
  String dataEndpoint;
  Map<String, String> headers;
  int timeout;

  /// Initial [LineBotApi] with [channelAccessToken]
  LineBotApi(String channelAccessToken,
      {String endpoint, String dataEndpoint, int timeout})
      : channelAccessToken = channelAccessToken,
        endpoint = endpoint ?? defaultApiEndpoint,
        dataEndpoint = dataEndpoint ?? defaultApiDataEndpoint,
        timeout = timeout ?? defaultTimeout {
    headers = {
      'Authorization': 'Bearer ' + channelAccessToken.toString(),
      'User-Agent': 'line-bot-sdk-dart/${version}',
      'Content-Type': 'application/json',
    };
  }

  /// Reply message with [replyToken] and [messages]
  Future<http.Response> replyMessage(
          String replyToken, List<Message> messages) =>
      _replyMessage(replyToken, messages);

  /// Push message with [messages]
  Future<http.Response> pushMessage(PushMessage messages) =>
      _pushMessage(messages);

  /// Get user profile by passing [userId]
  Future<Profile> getProfile(String userId) => _getProfile(userId);

  /// Get Bot's followers, pass next token to [next] if that is an available
  /// next token in the Followers object.
  Future<Followers> getFollowers([String next]) => _getFollowers(next);

  /// Get Bot info
  Future<BotInfo> getBotInfo() => _getBotInfo();

  /// Get group summary
  Future<GroupSummary> getGroupSummary(String groupId) =>
      _getGroupSummary(groupId);

  Future<http.Response> _replyMessage(
      String replyToken, List<Message> messages) async {
    var _replyMessage =
        ReplyMessage(replyToken: replyToken, messages: messages);

    return await _post(endpoint + '/v2/bot/message/reply', _replyMessage);
  }

  Future<http.Response> _pushMessage(PushMessage messages) async {
    return await _post(endpoint + '/v2/bot/message/push', messages);
  }

  Future<Profile> _getProfile(String userId) async {
    Profile profile;
    var response = await _get(endpoint + '/v2/bot/profile/${userId}');
    if (response.statusCode == httpStatusOk) {
      profile = Profile.fromJson(jsonDecode(response.body));
    }
    return profile;
  }

  Future<Followers> _getFollowers([String next]) async {
    Followers followers;
    var response = await _get((next != null)
        ? endpoint + '/v2/bot/followers/ids?start=${next}'
        : endpoint + '/v2/bot/followers/ids');
    if (response.statusCode == httpStatusOk) {
      followers = Followers.fromJson(jsonDecode(response.body));
    }
    return followers;
  }

  Future<BotInfo> _getBotInfo() async {
    BotInfo botInfo;
    var response = await _get(endpoint + '/v2/bot/info');
    if (response.statusCode == httpStatusOk) {
      botInfo = BotInfo.fromJson(jsonDecode(response.body));
    }
    return botInfo;
  }

  Future<GroupSummary> _getGroupSummary(String groupId) async {
    GroupSummary groupSummary;
    var response = await _get(endpoint + '/v2/bot/group/${groupId}/summary');
    if (response.statusCode == httpStatusOk) {
      groupSummary = GroupSummary.fromJson(jsonDecode(response.body));
    }
    return groupSummary;
  }

  Future<http.Response> _post(String url, dynamic body) async =>
      await http.post(url, headers: headers, body: jsonEncode(body));

  Future<http.Response> _get(String url) async =>
      await http.get(url, headers: headers);
}
