import 'package:hive_mobile/app/constants/network_images.dart';

class ActivityModel {
  final String title;
  final String dayTime;
  final String date;
  final String campusName;
  final String eventBy;
  final String peopleNumber;
  final String description;
  final String imageUrl;

  const ActivityModel({
    required this.title,
    required this.dayTime,
    required this.date,
    required this.campusName,
    required this.eventBy,
    required this.peopleNumber,
    required this.description,
    required this.imageUrl,
  });

  static const activity = ActivityModel(
    title: "Music Concert",
    dayTime: "Saturday at 4:30 PM",
    date: "13 Jan",
    campusName: "Beaconhouse Lahore Campus",
    eventBy: "Lorem Ipsum Dolor",
    peopleNumber: "43",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut viverra ex ut sapien bibendum, nec cursus arcu scelerisque. Mauris ac purus felis. Aenean pellentesque auctor consequat. Nulla facilisi. Cras interdum vestibulum lacus et auctor. Sed eu ante ac ante imperdiet molestie. Vestibulum a pretium risus.",
    imageUrl: NetworkImages.activityImage,
  );
}
