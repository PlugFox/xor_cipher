# Symmetric XOR cipher library
  
[![platform_info](https://img.shields.io/pub/v/xor_cipher.svg)](https://pub.dev/packages/xor_cipher)
[![Actions Status](https://github.com/PlugFox/xor_cipher/actions/workflows/checkout.yml/badge.svg)](https://github.com/PlugFox/xor_cipher/actions/workflows/checkout.yml)
[![Coverage](https://codecov.io/gh/PlugFox/xor_cipher/branch/master/graph/badge.svg)](https://codecov.io/gh/PlugFox/xor_cipher)
[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)
[![Linter](https://img.shields.io/badge/style-linter-40c4ff.svg)](https://dart-lang.github.io/linter/lints/)
  
  
## Usage example
  
```dart
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
```
  
  
## Coverage  
  
[![](https://codecov.io/gh/PlugFox/xor_cipher/branch/master/graphs/sunburst.svg)](https://codecov.io/gh/PlugFox/xor_cipher/branch/master)  
  
  
## Changelog  
  
Refer to the [Changelog](https://github.com/plugfox/xor_cipher/blob/master/CHANGELOG.md) to get all release notes.  
  
  
## Maintainers  
  
[Plague Fox](https://plugfox.dev)  
  
  
## License  
  
[MIT](https://github.com/plugfox/xor_cipher/blob/master/LICENSE)  
  
  