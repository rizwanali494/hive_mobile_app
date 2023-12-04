import 'dart:async';

enum EventType {
  announcementOpened,
  // Add more event types as needed
}

class EventBus {
  final _controller = StreamController<Event>.broadcast();

  Stream<Event> get stream => _controller.stream;

  void publish(Event event) {
    _controller.add(event);
  }

  void dispose() {
    _controller.close();
  }

  Stream<Event> on(EventType eventType) {
    return _controller.stream.where((event) => event.type == eventType);
  }
}

class Event<T> {
  final EventType type;
  final T data;

  Event(this.type, {required this.data});
}

class MyListener {
  final EventBus eventBus;
  late StreamSubscription<Event> _subscription;

  MyListener({required this.eventBus}) {
    // Only listen to 'announcementOpened' events
    _subscription = eventBus.on(EventType.announcementOpened).listen((event) {
      // Handle 'announcementOpened' events
      print('Received announcementOpened event with data: ${event.data}');
    });
  }

  void dispose() {
    _subscription.cancel();
  }
}
