import 'dart:convert';
import 'dart:io';

import 'package:line_bot_sdk_dart/linebot.dart';

Future main() async {
  var envVars = Platform.environment;
  var lineChannelSecret = envVars['LINE_CHANNEL_SECRET'];
  var lineChannelAccessToken = envVars['LINE_CHANNEL_ACCESS_TOKEN'];
  var server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    8080,
  );

  var webhookParser = WebhookParser(lineChannelSecret);
  var lineBotApi = LineBotApi(lineChannelAccessToken);
  await for (var request in server) {
    if (request.method == 'POST' && request.uri.path == '/callback') {
      handleRequest(request, webhookParser, lineBotApi);
    } else {
      handleUnSupportedRequest(request);
    }
  }
}

void handleRequest(HttpRequest request, WebhookParser webhookParser,
    LineBotApi lineBotApi) async {
  var response = request.response;
  var content = await utf8.decoder.bind(request).join();
  var message;
  try {
    message = webhookParser.parser(
        content.toString(), request.headers['x-line-signature'][0]);
  } on InvalidSignatureError {
    await response
      ..statusCode = HttpStatus.badRequest
      ..write('InvalidSignatureError')
      ..close();
    return;
  }
  if (message.events.isNotEmpty) {
    print('process');
    message.events.forEach((event) async {
      if (event is MessageEvent) {
        var replyMessage;
        switch (event.message.runtimeType) {
          case TextMessage:
            replyMessage = ReplyMessage(
                replyToken: event.replyToken,
                messages: [Message(type: 'text', text: event.message.text)]);
        }
        await lineBotApi.replyMessage(replyMessage);
      }
    });
    response
      ..statusCode = HttpStatus.ok
      ..write('Request Accepted.');
  } else {
    print('empty events');
  }
  await response.close();
}

void handleUnSupportedRequest(HttpRequest request) {
  var response = request.response;
  response
    ..statusCode = HttpStatus.methodNotAllowed
    ..write('Unsupported request: ${request.method}.')
    ..close();
}
