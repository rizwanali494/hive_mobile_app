import 'dart:async';
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

  Stream<Event> on<T>() {
    return _controller.stream.where((event) => event.runtimeType == Event<T>);
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

// Sending an object to update the list
// final announcement = Announcement(id: '123', title: 'Example Announcement');
// eventBus.publish(Event(EventType.announcementOpened, data: announcement));

// Sending an ID to fetch the model
// eventBus.publish(Event(EventType.announcementOpened, id: '123'));

void send() {
  // eventBus.on(EventType.announcementOpened).listen((event) {
  //   if (event.data != null) {
  //     // Handle the case where a complete object is sent to update the list
  //     final announcement = event.data as Announcement;
  //     // Update the list with the announcement
  //   } else if (event.id != null) {
  //     // Handle the case where only an ID is sent to fetch the model
  //     final announcementId = event.id;
  //     // Fetch the model using the announcementId
  //   }
  // });
}