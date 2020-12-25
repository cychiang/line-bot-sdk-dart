Library of the LINE Messaging API for Dart 

**IMPORTANT: This is not an official SDK by LINE**

## Introduction

We make it easy to developers to code their bots with Dart! A few steps to create a parser and bot to handle requests and reply messages. 
The library is based on the official [LINE Messaging API Document][line_messaging_api] and inspired by the official SDK: [line-bot-sdk-python][line_bot_sdk_python] 

[line_messaging_api]: https://developers.line.biz/en/reference/messaging-api
[line_bot_sdk_python]: https://github.com/line/line-bot-sdk-python

## Implemented methods, events and messages

- [x] Support parser and test cases for [webhook event objects][webhook_event_objects]
- [x] Validation with signature from `x-line-signature`
- [x] Reply message with TextMessage

[webhook_event_objects]: https://developers.line.biz/en/reference/messaging-api/#webhook-event-objects

## Example

```dart
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
    var messages = [
      Message(type: 'text', text: message.events[0].message.text)
    ];
    await lineBotApi.replyMessage(message.events[0].replyToken, messages);
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
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][issue_tracker].

[issue_tracker]: https://github.com/cychiang/line-bot-sdk-dart/issues
