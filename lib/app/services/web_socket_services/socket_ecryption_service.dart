import 'package:encrypt/encrypt.dart';

class SocketEncryptionService {
  Map<String, String> encryptedAuthData(String plainText, String key) {
    final eKey = Key.fromUtf8(key);
    final ivv = IV.fromSecureRandom(16);
    final encrypter = Encrypter(AES(eKey, mode: AESMode.cbc));
    final cText = encrypter.encrypt(plainText, iv: ivv);
    return {
      "cipher_text": cText.base64,
      "iv": ivv.base64,
    };
  }
}
