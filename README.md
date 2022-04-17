# Symmetric XOR cipher library
  
[![platform_info](https://img.shields.io/pub/v/xor_cipher.svg)](https://pub.dev/packages/xor_cipher)
[![Actions Status](https://github.com/PlugFox/xor_cipher/actions/workflows/main.yml/badge.svg)](https://github.com/PlugFox/xor_cipher/actions)
[![Coverage](https://codecov.io/gh/PlugFox/xor_cipher/branch/master/graph/badge.svg)](https://codecov.io/gh/PlugFox/xor_cipher)
[![License: WTFPL](https://img.shields.io/badge/License-WTFPL-brightgreen.svg)](https://en.wikipedia.org/wiki/WTFPL)
[![Linter](https://img.shields.io/badge/style-effective_dart-40c4ff.svg)](https://github.com/tenhobi/effective_dart)
  
  
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
  
  