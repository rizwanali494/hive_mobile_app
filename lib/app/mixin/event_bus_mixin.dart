import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/services/web_socket_services/event_bus_service.dart';

mixin EventBusMixin {
  final _eventBus = GetIt.instance.get<EventBus>();

  void publishEvent<T>({required T data}) {
    final event = Event<T>(data: data);
    _eventBus.publish(event);
  }
}
