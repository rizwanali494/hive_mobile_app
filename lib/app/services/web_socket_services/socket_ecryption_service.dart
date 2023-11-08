import 'package:encrypt/encrypt.dart';

class SocketEncryptionService {
  Map<String, dynamic> encryptedAuthData(String plainText, String key) {
    final eKey = Key.fromUtf8(key);
    final ivv = IV.fromSecureRandom(16);
    final encrypter = Encrypter(AES(eKey, mode: AESMode.cbc));
    final cText = encrypter.encrypt(plainText, iv: ivv);
    return {
      "type": "authenticate",
      "data": {"iv": "${ivv.base64}", "cipherText": "${cText.base64}"}
    };
  }
}
