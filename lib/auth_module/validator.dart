class Validator {
  static bool emailIsEmpty(String email) {
    return email.isEmpty;
  }

  static bool emailIsValid(String email) {
    return email.contains('@') && email.contains('.');
  }

  static bool passwordIsLongEnough(String password) {
    return password.length >= 8;
  }

  static bool bothPasswordsMatch(String firstPassword, String secondPassword) {
    return firstPassword == secondPassword;
  }

  static bool allSignInEntriesAreValid(String email, String password) {
    return !emailIsEmpty(email) &&
        emailIsValid(email) &&
        passwordIsLongEnough(password);
  }

  static bool allSignUpEntriesAreValid(
      String email, String password, String secondPassword) {
    return !emailIsEmpty(email) &&
        emailIsValid(email) &&
        passwordIsLongEnough(password) &&
        bothPasswordsMatch(password, secondPassword);
  }
}
