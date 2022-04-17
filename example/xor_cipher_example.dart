// ignore_for_file: avoid_print

import 'package:xor_cipher/xor_cipher.dart';

void main() {
  const source = 'Hello 🦊 world!!!';
  const secret = 'Top 😺 secret';
  print(
    'Source: $source\n'
    'Secret: $secret',
  );
  final encrypted = XOR.encrypt(source, secret, urlEncode: true);
  print('Encrypted: $encrypted');
  final decrypted = XOR.decrypt(encrypted, secret, urlDecode: true);
  print(
    'Decrypted: $decrypted\n'
    'Identical: ${identical(source, decrypted)}',
  );
}
