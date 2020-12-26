import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:line_bot/line_bot.dart';

class LineBotApi {
  static const defaultApiEndpoint = 'https://api.line.me';
  static const defaultApiDataEndpoint = 'https://api-data.line.me';
  static const defaultTimeout = 30;
  String channelAccessToken;
  String endpoint;
  String dataEndpoint;
  Map<String, String> headers;
  int timeout;

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
  Future<http.Response> replyMessage(
      String replyToken, List<Message> messages) async {
    var replyMessage = ReplyMessage(replyToken: replyToken, messages: messages);

    return await _post(endpoint + '/v2/bot/message/reply', replyMessage);
  }

  Future<http.Response> pushMessage(PushMessage messages) async {
    return await _post(endpoint + '/v2/bot/message/push', messages);
  }

  Future<Profile> getProfile(String userId) async {
    Profile profile;
    var response = await _get(endpoint + '/v2/bot/profile/${userId}');
    if (response.statusCode == HttpStatus.ok) {
      profile = Profile.fromJson(jsonDecode(response.body));
    }
    return profile;
  }

  Future<Followers> getFollowers({String next}) async {
    Followers followers;
    var response = await _get((next != null)
        ? endpoint + '/v2/bot/followers/ids?start=${next}'
        : endpoint + '/v2/bot/followers/ids');
    if (response.statusCode == HttpStatus.ok) {
      followers = Followers.fromJson(jsonDecode(response.body));
    }
    return followers;
  }

  Future<BotInfo> getBotInfo() async {
    BotInfo botInfo;
    var response = await _get(endpoint + '/v2/bot/info');
    if (response.statusCode == HttpStatus.ok) {
      botInfo = BotInfo.fromJson(jsonDecode(response.body));
    }
    return botInfo;
  }

  Future<http.Response> _post(String url, dynamic body) async =>
      await http.post(url, headers: headers, body: jsonEncode(body));

  Future<http.Response> _get(String url) async =>
      await http.get(url, headers: headers);
}
