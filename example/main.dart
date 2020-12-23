import 'dart:io';
import 'dart:convert';
import 'package:line_bot_sdk_dart/linebot.dart';
// import 'package:line_bot_sdk_dart/src/models/legacy/message_objects.dart';
// import 'package:line_bot_sdk_dart/src/models/reply_message.dart';

Future main() async {
  var server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    8080,
  );
  var envVars = Platform.environment;
  var lineChannelSecret = envVars['LINE_CHANNEL_SECRET'];
  var lineChannelAccessToken = envVars['LINE_CHANNEL_ACCESS_TOKEN'];

  var webhookParser = WebhookParser(lineChannelSecret);
  var lineBotApi = LineBotApi(lineChannelAccessToken);
  await for (var request in server) {
    if (request.method == 'POST') {
      handleRequest(request, webhookParser, lineBotApi);
    } else {
      unSupportedRequest(request);
    }
  }
}

void handleRequest(HttpRequest request, WebhookParser webhookParser, LineBotApi lineBotApi) async {
  var response = request.response;
  if (request.uri.path == '/callback') {
    var content = await utf8.decoder.bind(request).join();
    var message = webhookParser.parser(
        content.toString(), request.headers['x-line-signature'][0]);
    if (message.events.isNotEmpty) {
      // var textMessage = TextMessage(
      //   type: 'text',
      //   text: 'Hello World'
      // );
      // var replyMessage = ReplyMessage(
      //   replyToken: message.events[0].replyToken,
      //   messages: [textMessage.toJson()],
      // );
      // await lineBotApi.replyMessage(message.events[0].replyToken, replyMessage);
    }

    response
      ..statusCode = HttpStatus.ok
      ..write('Request Accepted.');
  } else {
    response
      ..statusCode = HttpStatus.methodNotAllowed
      ..write('Unsupported request: ${request.method}.');
  }
  await response.close();
}

void unSupportedRequest(HttpRequest request) {
  var response = request.response;
  response
    ..statusCode = HttpStatus.methodNotAllowed
    ..write('Unsupported request: ${request.method}.')
    ..close();
}
