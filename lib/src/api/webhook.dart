import '../exceptions.dart';
import '../models/webhook_event_objects.dart';
import 'dart:convert' show base64Encode, jsonDecode, utf8;

import 'package:crypto/crypto.dart';

class SignatureValidator {
  List<int> channelSecret;
  bool skipValidator;
  SignatureValidator(String channelSecret, bool skipValidator)
      : channelSecret = utf8.encode(channelSecret),
        skipValidator = skipValidator;

  bool validate(String body, String signature) {
    if (skipValidator) return true;
    var genSignature = Hmac(sha256, channelSecret);
    var digest = genSignature.convert(utf8.encode(body));
    return signature.compareTo(base64Encode(digest.bytes)) == 0 ? true : false;
  }
}

class WebhookParser {
  SignatureValidator signatureValidator;
  WebhookParser(String channelSecret, {bool skipValidator = false})
      : signatureValidator = SignatureValidator(channelSecret, skipValidator);

  WebhookEventObjects parser(String body, String signature) {
    if (!signatureValidator.validate(body, signature)) {
      throw InvalidSignatureError('Invalid signature. signature=$signature');
    }
    return WebhookEventObjects.fromJson(jsonDecode(body));
  }
}
