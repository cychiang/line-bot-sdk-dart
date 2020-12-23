import 'dart:convert';

import 'package:http/http.dart' as http;

class LineBotApi {
  static const defaultApiEndpoint = 'https://api.line.me';
  static const defaultApiDataEndpoint = 'https://api-data.line.me';
  static const defaultTimeout = 30;
  static const apiVersion = '/v2';
  static const sendReplyMessage =
      defaultApiDataEndpoint + apiVersion + '/bot/message/reply'; // POST
  static const sendPushMessage =
      defaultApiDataEndpoint + apiVersion + '/bot/message/push'; // POST
  String channelAccessToken;
  String endpoint;
  String dataEndpoint;
  Map<String, String> headers;
  int timeout;

  LineBotApi(String channelAccessToken,
      [String endpoint, String dataEndpoint, int timeout])
      : channelAccessToken = channelAccessToken,
        endpoint = endpoint ?? defaultApiEndpoint,
        dataEndpoint = dataEndpoint ?? defaultApiDataEndpoint,
        timeout = timeout ?? defaultTimeout {
    headers = {
      'Authorization': 'Bearer ' + channelAccessToken.toString(),
      'User-Agent': 'test',
      'Content-Type': 'application/json',
    };
  }
  Future<http.Response> replyMessage(dynamic message) async {
    return await _post(sendReplyMessage, headers, message);
  }

  Future<http.Response> pushMessage(dynamic message) async {
    return await _post(sendReplyMessage, headers, message);
  }

  Future<http.Response> _post(
      String url, Map<String, String> headers, String body) async {
    var response =
        await http.post(url, headers: headers, body: jsonEncode(body));
    return response;
  }
}
