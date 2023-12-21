import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/services/web_socket_services/web_socket_service.dart';

class APIEventHandler {
  List<String>? apiEventTypes;
  final Function(dynamic data) handleEvent;

  APIEventHandler({this.apiEventTypes, required this.handleEvent}) {
    _listenToEvents();
  }

  StreamSubscription? _apiEventStream;
  final webSocketService = GetIt.instance.get<WebSocketService>();

  void _listenToEvents() {
    _apiEventStream = webSocketService.dataStream?.where((event) {
      final data = jsonDecode(event);
      String eventType = data["type"] ?? "";
      return apiEventTypes?.contains(eventType) ?? false;
    }).listen(
      (event) {
        log("handle Event :: ${event}");
        handleEvent.call(event);
      },
    );
  }

  void dispose() {
    _apiEventStream?.cancel();
  }
}
