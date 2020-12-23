import 'dart:convert' show base64Encode, jsonDecode, utf8;

import 'package:crypto/crypto.dart';

import '../exceptions.dart';
import '../models/events/webhook_event.dart';

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

  WebhookEvent parser(String body, String signature) {
    if (!signatureValidator.validate(body, signature)) {
      throw InvalidSignatureError('Invalid signature. signature=$signature');
    }
    return WebhookEvent.fromJson(jsonDecode(body));
  }
}

// event_type = event['type']
// if event_type == 'message':
// events.append(MessageEvent.new_from_json_dict(event))
// elif event_type == 'follow':
// events.append(FollowEvent.new_from_json_dict(event))
// elif event_type == 'unfollow':
// events.append(UnfollowEvent.new_from_json_dict(event))
// elif event_type == 'join':
// events.append(JoinEvent.new_from_json_dict(event))
// elif event_type == 'leave':
// events.append(LeaveEvent.new_from_json_dict(event))
// elif event_type == 'postback':
// events.append(PostbackEvent.new_from_json_dict(event))
// elif event_type == 'beacon':
// events.append(BeaconEvent.new_from_json_dict(event))
// elif event_type == 'accountLink':
// events.append(AccountLinkEvent.new_from_json_dict(event))
// elif event_type == 'memberJoined':
// events.append(MemberJoinedEvent.new_from_json_dict(event))
// elif event_type == 'memberLeft':
// events.append(MemberLeftEvent.new_from_json_dict(event))
// elif event_type == 'things':
// events.append(ThingsEvent.new_from_json_dict(event))
// elif event_type == 'unsend':
// events.append(UnsendEvent.new_from_json_dict(event))
// elif event_type == 'videoPlayComplete':
// events.append(VideoPlayCompleteEvent.new_from_json_dict(event))
// else:
// LOGGER.warn('Unknown event type. type=' + event_type)
