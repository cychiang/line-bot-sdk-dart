import '../exceptions.dart';
import '../models/webhook_event_objects.dart';
import 'dart:convert' show base64Encode, jsonDecode, utf8;

import 'package:crypto/crypto.dart';

class SignatureValidator {
  List<int> channelSecret;
  SignatureValidator(String channelSecret)
      : channelSecret = utf8.encode(channelSecret);

  bool validate(String body, String signature) {
    var genSignature = Hmac(sha256, channelSecret);
    var digest = genSignature.convert(utf8.encode(body));
    return signature.compareTo(base64Encode(digest.bytes)) == 0 ? true : false;
  }
}

class WebhookParser {
  SignatureValidator signatureValidator;
  WebhookParser(String channelSecret)
      : signatureValidator = SignatureValidator(channelSecret);

  WebhookEventObjects parser(String body, String signature,
      [bool skipValidator = false]) {
    if (skipValidator) {
      return WebhookEventObjects.fromJson(jsonDecode(body));
    }
    if (!signatureValidator.validate(body, signature)) {
      throw InvalidSignatureError('Invalid signature. signature=$signature');
    }
    return WebhookEventObjects.fromJson(jsonDecode(body));
  }
}
