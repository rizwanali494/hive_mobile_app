abstract class AuthService<T> {
  Future<T?> logIn();

  Future<void> logOut() async {}
}
