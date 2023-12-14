import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/services/web_socket_services/event_bus_service.dart';

mixin EventBusMixin {
  final _eventBus = GetIt.instance.get<LocalEventBus>();

  void publishEvent<T>({required T data}) {
    if (data == null) {
      return;
    }
    final event = Event<T>(data: data);
    _eventBus.publish(event);
  }
}
