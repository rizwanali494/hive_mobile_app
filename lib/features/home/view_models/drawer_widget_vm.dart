import 'package:hive_mobile/app/models/data/user_model/user_model.dart';

class DrawerWidgetVM {
  final UserModel userModel;

  DrawerWidgetVM({required this.userModel});

  String? get userImage => userModel.picture?.file;

  String get userName => userModel.accountData?.studentName ?? "";
}
