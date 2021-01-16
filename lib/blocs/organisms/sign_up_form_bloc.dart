import 'package:flutter/material.dart';
import 'package:medizorg/auth_module/authenticator.dart';
import 'package:medizorg/auth_module/validator.dart';

class SignUpFormBloc extends ChangeNotifier {
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
