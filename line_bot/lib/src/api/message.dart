import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:line_bot/line_bot.dart';

import '../models/messages.dart';
import '../models/profile.dart';

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

  Future<Followers> getFollowers() async {
    Followers followers;
    var response = await _get(endpoint + '/v2/bot/followers/ids');
    if (response.statusCode == HttpStatus.ok) {
      followers = Followers.fromJson(jsonDecode(response.body));
      while (followers.next.isNotEmpty) {
        Followers _followers;
        response = await _get(
            endpoint + '/v2/bot/followers/ids?start=${followers.next}');
        if (response.statusCode == HttpStatus.ok) {
          _followers = Followers.fromJson(jsonDecode(response.body));
        } else {
          break;
        }
        followers.userIds.addAll(_followers.userIds);
        if (_followers.next.isEmpty) {
          break;
        } else {
          followers.next = _followers.next;
        }
      }
    }
    return followers;
  }

  Future<http.Response> _post(String url, dynamic body) async {
    var response =
        await http.post(url, headers: headers, body: jsonEncode(body));
    return response;
  }

  Future<http.Response> _get(String url) async {
    var response = await http.get(url);
    return response;
  }
}
