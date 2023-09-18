import 'package:hive_mobile/app/models/data/message_model.dart';

class DateMessage {
  const factory DateMessage.Data(String a) = MessageDate;

  const factory DateMessage.Message(MessageModel model) = MessageData;
}

class MessageData implements DateMessage {
  final MessageModel model;

  const MessageData(this.model);
}

class MessageDate implements DateMessage {
  final String date;

  const MessageDate(this.date);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageDate &&
          runtimeType == other.runtimeType &&
          date == other.date;

  @override
  int get hashCode => date.hashCode;
}
