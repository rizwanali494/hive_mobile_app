import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String fileName = ".env";
  static String socketSecretKey = dotenv.get("Socket_Key");
}
