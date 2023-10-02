import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/user_model/user_model.dart';

final getIt = GetIt.instance;

void registerUserModel(UserModel model) {
  getIt.registerSingleton<UserModel>(model);
}
