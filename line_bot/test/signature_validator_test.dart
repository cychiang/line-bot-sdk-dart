import 'dart:io';

import 'package:line_bot/line_bot.dart';
import 'package:test/test.dart';

void main() {
  group('Test SignatureValidator', ()
  {
    SignatureValidator signatureValidator;
    setUp(() async {
      signatureValidator = SignatureValidator('channel_secret', false);
    });
    test('Validate Signature...', () {
      expect(
          signatureValidator.validate('bodybodybodybody',
              '/gg9a+LvFevTH1sd7XCQycD7tsWclCsInj7MhBHxN7k='),
          isTrue);
    });
    test('Invalidate Signature...', () {
      expect(
          signatureValidator.validate('bodybodybodybody', 'invalid_signature'),
          isFalse);
    });
  });
}