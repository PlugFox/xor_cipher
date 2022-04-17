/// Dart symmetric XOR cipher

library xor_cipher;

import 'dart:convert' show base64Url;
import 'package:meta/meta.dart' show sealed;

// ignore_for_file: avoid_classes_with_only_static_members

/// Dart symmetric XOR cipher
@sealed
abstract class XOR {
  /// XOR symmetric encryption
  /// [data] - source data
  /// [secret] - encryption and decryption key
  /// [urlEncode] - must be used if special characters are used
  ///
  /// Throws an [StateError] in case of an unexpected error
  static String encrypt(
    /// source data
    String data,

    /// encryption and decryption key
    String secret, {

    /// must be used if special characters are used
    bool urlEncode = false,
  }) {
    assert(secret != '', 'Secret cannot be empty string');
    if (data == '') return '';
    try {
      final sourceCodes =
          (urlEncode ? Uri.encodeComponent(data) : data).codeUnits;
      final secretCodes =
          (urlEncode ? Uri.encodeComponent(secret) : secret).codeUnits;
      final sourceLength = sourceCodes.length;
      final secretLength = secretCodes.length;
      Iterable<int> innerEncrypt() sync* {
        for (var i = 0; i < sourceLength; i++) {
          yield sourceCodes[i] ^ secretCodes[i % secretLength];
        }
      }

      String base64Unpadded(String value) {
        const kPadSymbol = 61; // '='
        final length = value.length;
        if (value.codeUnitAt(length - 1) == kPadSymbol) {
          if (value.codeUnitAt(length - 2) == kPadSymbol) {
            return value.substring(0, length - 2); // trim ==
          }

          return value.substring(0, length - 1); // trim =
        }
        return value;
      }

      return base64Unpadded(
        base64Url.encode(
          innerEncrypt().toList(growable: false),
        ),
      );
    } on Object catch (error, stackTrace) {
      Error.throwWithStackTrace(
        StateError('XOR cipher can not encode source string'),
        stackTrace,
      );
    }
  }

  /// XOR symmetric decryption
  /// [data] - encrypted data
  /// [secret] - encryption and decryption key
  /// [urlDecode] - must be used if special characters are used
  ///
  /// Throws an [StateError] in case of an unexpected error
  static String decrypt(
    /// encrypted data
    String data,

    /// encryption and decryption key
    String secret, {

    /// must be used if special characters are used
    bool urlDecode = false,
  }) {
    assert(secret != '', 'Secret cannot be empty string');
    if (data == '') return '';
    try {
      final sourceCodes = base64Url.decode(base64Url.normalize(data));
      final secretCodes =
          (urlDecode ? Uri.encodeComponent(secret) : secret).codeUnits;
      final sourceLength = sourceCodes.length;
      final secretLength = secretCodes.length;
      Iterable<int> innerDecrypt() sync* {
        for (var i = 0; i < sourceLength; i++) {
          yield sourceCodes[i] ^ secretCodes[i % secretLength];
        }
      }

      final component = String.fromCharCodes(innerDecrypt());
      return urlDecode ? Uri.decodeComponent(component) : component;
    } on Object catch (error, stackTrace) {
      Error.throwWithStackTrace(
        StateError('XOR cipher can not decode source string'),
        stackTrace,
      );
    }
  }
}
