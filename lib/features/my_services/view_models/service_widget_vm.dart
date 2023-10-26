
import 'package:hive_mobile/app/extensions/date_time_extension.dart';
import 'package:hive_mobile/app/models/data/my_services_model.dart';

class ServiceWidgetVM {
  final MyServicesModel model;

  ServiceWidgetVM({required this.model});

  String get title => model.name ?? "";

  String get description => model.description ?? "";

  String get time {
    var time = DateTime.tryParse(model.dateAdded ?? "") ?? DateTime.now();
    return time.formattedTime;
  }

  bool get isOpen => model.isOpen;

  bool get isClosed => model.isClosed;
}
