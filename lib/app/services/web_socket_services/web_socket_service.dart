import 'dart:async';
import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/extensions/string_extension.dart';
import 'package:hive_mobile/app/services/web_socket_services/socket_ecryption_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_client/web_socket_client.dart';

class WebSocketService with SocketEncryptionService {
  WebSocket? socket;
  final _key = "C8620628BE2507E2";
  final _socketUrl = "ws://hive.bcp.net.pk/ws/ping/";

  late final sharedPref = GetIt.instance.get<SharedPreferences>();

  Future<void> connect() async {
    final token = sharedPref.getString("token") ?? "";
    final data = jsonEncode(encryptedAuthData(token, _key));
    socket = WebSocket(_socketUrl.parsedUri);
    await socket?.connection.firstWhere((state) => state is Connected);
    _sendAuthData(data);
  }

  void _sendAuthData(data) {
    socket?.send(data);
  }

  StreamSubscription? socketStream;

  void setMessagesStream() {
    socketStream = socket?.messages.listen((event) {});
  }

  void disconnectAll() {
    socketStream?.cancel();
    socket?.close();
  }
}
