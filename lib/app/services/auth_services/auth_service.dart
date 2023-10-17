import 'package:hive_mobile/app/models/user_auth_model.dart';

abstract class AuthService {
  Future<UserAuthModel?> logIn();

  Future<void> logOut() async {}
}
