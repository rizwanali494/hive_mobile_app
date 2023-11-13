import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/constants/environment.dart';
import 'package:hive_mobile/app/extensions/string_extension.dart';
import 'package:hive_mobile/app/services/web_socket_services/socket_ecryption_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_client/web_socket_client.dart';

class WebSocketService with SocketEncryptionService {
  WebSocket? socket;
  final _key = Environment.socketSecretKey;
  final _socketUrl = "ws://hive.bcp.net.pk/ws/ping/";

  late final sharedPref = GetIt.instance.get<SharedPreferences>();

  Future<void> connect() async {
    socket = WebSocket(
      _socketUrl.parsedUri,
      backoff: ConstantBackoff(
        Duration(seconds: 5),
      ),
    );
    handleAuth();
    // await socket?.connection.firstWhere((state) => state is Connected);
  }

  bool _isAuthenticated = false;

  void handleAuth() {
    socket?.connection.listen((event) {
      log("socket connection : ${event}");
      bool reconnected = event is Reconnected;
      bool connected = event is Connected;
      bool reAuth = reconnected || connected;
      log("ReAuth value : ${reAuth} ${reconnected} ${connected}");
      if (reAuth) {
        log("ReAuth");
        if (!_isAuthenticated) {
          final token = sharedPref.getString("token") ?? "";
          log("Data Sent");
          final data = encryptedAuthData(token, _key);
          _sendAuthData(data);
          _isAuthenticated = true;
        }
      }
      else {
        _isAuthenticated = false;
      }
    });
  }

  void _sendAuthData(data) {
    socket?.send(jsonEncode(data));
  }

  Stream? get dataStream => socket?.messages;

  void disconnectAll() {
    socket?.close();
  }
}
