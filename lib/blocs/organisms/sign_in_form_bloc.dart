import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medizorg/utils/strings.dart';
import 'package:medizorg/auth_module/authenticator.dart';
import 'package:medizorg/auth_module/validator.dart';

class SignInFormBloc extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  bool emailIsEmpty(String email) {
    return Validator.emailIsEmpty(email);
  }

  bool emailIsValid(String email) {
    return Validator.emailIsValid(email);
  }

  bool passwordIsLongEnough(String password) {
    return Validator.passwordIsLongEnough(password);
  }

  bool entriesAreValid(String email, String password) {
    return Validator.allSignInEntriesAreValid(email, password);
  }

  openPage(String routeName, BuildContext context) {
    Navigator.of(context).pushNamed(routeName);
  }

  getSuccessStatus(String email, String password, BuildContext context) {
    Future<String> result = signInUser(
      email,
      password,
    );
    if (result.toString() == FEEDBACK_SUCCESS) {
      openPage(ROUTE_HOME_PAGE, context);
    } else {
      snackify(context, result.toString());
    }
  }

  signInUser(String email, String password) async {
    Authenticator.signInUser(email, password);
  }

  openHomePage(BuildContext context) {
    Navigator.of(context).pushNamed(ROUTE_HOME_PAGE);
  }

  snackify(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
