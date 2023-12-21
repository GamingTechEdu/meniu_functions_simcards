abstract class IncludePresenter {
  Stream<String?>? get usernameErrorStream;
  Stream<String?>? get passwordErrorStream;
  Stream<String?>? get mainErrorStream;
  Stream<String?> get navigateToStream;
  Stream<bool?>? get isFormValidStream;
  Stream<bool?>? get isLoadingStream;

  void validateUsername(String username);
  void validatePassword(String password);
}
