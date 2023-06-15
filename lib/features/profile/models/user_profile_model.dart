import 'package:hive_mobile/app/constants/network_images.dart';

class UserProfileModel {
  final String name;
  final String imageUrl;
  final String description;
  final String gender;
  final String birthDate;
  final String campusName;
  final List<String> hobbies;

  final List<String> subjects;

  final List<String> acceptedUniversities;

  final List<String> achievementsAwards;

  const UserProfileModel({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.gender,
    required this.birthDate,
    required this.campusName,
    required this.hobbies,
    required this.subjects,
    required this.acceptedUniversities,
    required this.achievementsAwards,
  });

  static const user = UserProfileModel(
    name: "Awais Ali Khan",
    imageUrl: NetworkImages.userUrl,
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut lorem sed sem interdum sollicitudin.",
    gender: "Male",
    birthDate: "18 August 1997",
    campusName: "Beaconhouse Senior Campus Bahria Town-Lhr A-Level",
    hobbies: [
      "Gaming",
      "Praying",
      "News",
      "Podcast",
    ],
    subjects: [
      "English",
      "Urdu",
      "Pakistan Studies",
      "Mathematics",
    ],
    acceptedUniversities: [
      "Punjab University",
      "University of Education",
      "University of Engineering and Technology"
    ],
    achievementsAwards: ["Best Student of the Year", "Player of the Month"],
  );
}
