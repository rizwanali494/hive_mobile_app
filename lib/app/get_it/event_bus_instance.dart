import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/services/web_socket_services/event_bus_service.dart';

final _getIt = GetIt.instance;

Future<void> registerEventBusInstance() async {
  _getIt.registerSingleton(LocalEventBus());
}
