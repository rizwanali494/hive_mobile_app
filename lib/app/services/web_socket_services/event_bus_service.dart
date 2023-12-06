import 'dart:async';

class EventBus {
  final _controller = StreamController<Event>.broadcast();

  Stream<Event> get stream => _controller.stream;

  void publish<T>(Event<T> event) {
    _controller.add(event);
  }

  void dispose() {
    _controller.close();
  }

  Stream<Event<T>> on<T>() {
    return _controller.stream.where((event) => event.runtimeType == Event<T>)
        as Stream<Event<T>>;
  }
}

enum EventType {
  AnnouncementPost,
  Activity
}

class Event<T> {
  final EventType? type;
  final T? data;
  final String? id;

  Event({this.data, this.id,this.type});
}
