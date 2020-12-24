import 'dart:convert';
import 'dart:io';

import 'package:line_bot/line_bot.dart';

Future main() async {
  var envVars = Platform.environment;
  var lineChannelSecret = envVars['LINE_CHANNEL_SECRET'];
  var lineChannelAccessToken = envVars['LINE_CHANNEL_ACCESS_TOKEN'];
  var lineBotApi = LineBotApi(lineChannelAccessToken);
  var webhookParser = WebhookParser(lineChannelSecret);
  var server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    8080,
  );
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
  var message;
  var replyMessage;
  var response = request.response;
  var content = await utf8.decoder.bind(request).join();
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
    replyMessage = ReplyMessage(
        replyToken: message.events[0].replyToken,
        messages: [
          Message(type: 'text', text: message.events[0].message.text)
        ]);
    await lineBotApi.replyMessage(replyMessage);
  }
  response
    ..statusCode = HttpStatus.ok
    ..write('Request Accepted.')
    ..close();
}

void handleUnSupportedRequest(HttpRequest request) {
  var response = request.response;
  response
    ..statusCode = HttpStatus.methodNotAllowed
    ..write('Unsupported request: ${request.method}.')
    ..close();
}
