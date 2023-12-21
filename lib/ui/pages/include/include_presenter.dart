abstract class IncludePresenter {
  Stream<String?>? get usernameErrorStream;

  void validateUsername(String username);
  // void validatePassword(String password);
}
