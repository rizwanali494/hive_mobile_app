import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/services/web_socket_services/web_socket_service.dart';

final _getIt = GetIt.instance;

Future<void> registerSocketInstance() async {
  await _getIt.registerSingleton(WebSocketService());
}
