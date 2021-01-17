import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medizorg/utils/strings.dart';

class SignInFormBloc extends ChangeNotifier {
  final _emailFieldKey = GlobalKey<FormState>();
  GlobalKey<FormState> get emailFieldKey => _emailFieldKey;

  final _passwordFieldKey = GlobalKey<FormState>();
  GlobalKey<FormState> get passwordFieldKey => _passwordFieldKey;

  final _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  FirebaseAuth auth = FirebaseAuth.instance;

  disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
  }

  bool emailIsEmpty(String email) {
    return email.isEmpty;
  }

  bool emailIsValid(String email) {
    return email.contains('@') && email.contains('.');
  }

  bool passwordIsLongEnough(String password) {
    return password.length >= 8;
  }

  bool entriesAreValid(String email, String password) {
    return !emailIsEmpty(email) &&
        emailIsValid(email) &&
        passwordIsLongEnough(password);
  }

  openPage(String routeName, BuildContext context) {
    Navigator.of(context).pushNamed(routeName);
  }

  void getSuccessStatus(BuildContext context) {
    Future<String> result = signInUser(
      emailController.text,
      passwordController.text,
    );
    if (result.toString() == FEEDBACK_SUCCESS) {
      openPage(ROUTE_HOME_PAGE, context);
    } else {
      snackify(context, result.toString());
    }
  }

  Future<String> signInUser(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return 'no user found for that email.';
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return 'wrong password provided for that user.';
      }
    }
  }

  snackify(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
