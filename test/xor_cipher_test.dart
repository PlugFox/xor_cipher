import 'package:test/test.dart';
import 'package:xor_cipher/xor_cipher.dart';

// ignore_for_file: prefer_const_declarations

void main() {
  group('A group of smoke unit tests', () {
    test('Successful encrypting', () {
      expect(() => XOR.encrypt('a', 'b', urlEncode: false), returnsNormally);
      expect(() => XOR.encrypt('a', 'b', urlEncode: true), returnsNormally);
      expect(XOR.encrypt(':-)', 'C:', urlEncode: false), equals('eRdq'));
      expect(XOR.encrypt(':-)', 'C:', urlEncode: true), equals('ZhZybGo'));
    });

    test('Successful decrypting with url encode', () {
      expect(() => XOR.decrypt('Aw', 'b', urlDecode: false), returnsNormally);
      expect(() => XOR.decrypt('Aw', 'b', urlDecode: true), returnsNormally);
      expect(XOR.decrypt('eRdq', 'C:', urlDecode: false), equals(':-)'));
      expect(XOR.decrypt('ZhZybGo', 'C:', urlDecode: true), equals(':-)'));
    });

    test('Identical source and encrypted without url encode', () {
      final source = 'Hello world!!!';
      final secret = 'Top secret';
      final encrypted = XOR.encrypt(source, secret, urlEncode: false);
      final decrypted = XOR.decrypt(encrypted, secret, urlDecode: false);
      expect(source, equals(decrypted));
    });

    test('Identical source and encrypted with url encode', () {
      final source = 'Hello 🦊 world!!!';
      final secret = 'Top 😺 secret';
      final encrypted = XOR.encrypt(source, secret, urlEncode: true);
      final decrypted = XOR.decrypt(encrypted, secret, urlDecode: true);
      expect(source, equals(decrypted));
    });

    test('Empty secret', () {
      expect(
        () => XOR.encrypt('a', '', urlEncode: false),
        throwsA(isA<AssertionError>()),
      );
      expect(
        () => XOR.decrypt('Aw', '', urlDecode: false),
        throwsA(isA<AssertionError>()),
      );
      expect(
        () => XOR.encrypt('a', '', urlEncode: true),
        throwsA(isA<AssertionError>()),
      );
      expect(
        () => XOR.decrypt('Aw', '', urlDecode: true),
        throwsA(isA<AssertionError>()),
      );
      expect(
        () => XOR.encrypt('a', ' ', urlEncode: false),
        returnsNormally,
      );
      expect(
        () => XOR.decrypt('Aw', ' ', urlDecode: false),
        returnsNormally,
      );
      expect(
        () => XOR.encrypt('a', ' ', urlEncode: true),
        returnsNormally,
      );
      expect(
        () => XOR.decrypt('Aw', ' ', urlDecode: true),
        returnsNormally,
      );
    });

    test('Empty data', () {
      expect(XOR.encrypt('', 'a', urlEncode: false), isEmpty);
      expect(XOR.decrypt('', 'a', urlDecode: true), isEmpty);
      expect(XOR.encrypt('', 'a', urlEncode: false), equals(''));
      expect(XOR.decrypt('', 'a', urlDecode: true), equals(''));
      expect(XOR.encrypt(' ', 'a', urlEncode: false), equals('QQ'));
      expect(XOR.encrypt(' ', 'a', urlEncode: true), equals('RFNR'));
    });

    test('Encode state exception', () {
      expect(
        () => XOR.encrypt('🦊🦊🦊', 'b🦊', urlEncode: false),
        throwsStateError,
      );
    });

    test('Decode state exception', () {
      expect(
        () => XOR.decrypt('@', 'b', urlDecode: true),
        throwsStateError,
      );
    });
  });
}
