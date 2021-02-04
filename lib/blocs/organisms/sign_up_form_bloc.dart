import 'package:flutter/material.dart';
import 'package:medizorg/auth_module/authenticator.dart';
import 'package:medizorg/auth_module/validator.dart';

class SignUpFormBloc extends ChangeNotifier {
  bool _obscureText = true;
  bool get obscureText => _obscureText;
  set obscureText(bool value) {
    _obscureText = value;
    notifyListeners();
  }

  IconData _visibilityIcon = Icons.visibility_off_rounded;
  IconData get visibilityIcon => _visibilityIcon;
  set visibilityIcon(IconData icon) {
    _visibilityIcon = icon;
    notifyListeners();
  }

  changeVisibility() {
    if (obscureText == true) {
      obscureText = false;
      visibilityIcon = Icons.visibility_rounded;
    } else {
      obscureText = true;
      visibilityIcon = Icons.visibility_off_rounded;
    }
  }

  bool emailIsEmpty(String email) {
    return Validator.emailIsEmpty(email);
  }

  bool emailIsValid(String email) {
    return Validator.emailIsValid(email);
  }

  bool passwordIsLongEnough(String password) {
    return Validator.passwordIsLongEnough(password);
  }

  bool bothPasswordsMatch(String firstPassword, String secondPassword) {
    return Validator.bothPasswordsMatch(firstPassword, secondPassword);
  }

  bool allEntriesAreValid(
      String email, String password, String secondPassword) {
    return Validator.allSignUpEntriesAreValid(email, password, secondPassword);
  }

  createUser(String email, String password) async {
    Authenticator.createUser(email, password);
  }
}
