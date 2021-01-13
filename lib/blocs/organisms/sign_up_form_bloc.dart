import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpFormBloc extends ChangeNotifier {
  final _emailFieldKey = GlobalKey<FormState>();
  GlobalKey<FormState> get emailFieldKey => _emailFieldKey;

  final _passwordFieldKey = GlobalKey<FormState>();
  GlobalKey<FormState> get passwordFieldKey => _passwordFieldKey;

  final _confirmPasswordFieldKey = GlobalKey<FormState>();
  GlobalKey<FormState> get confirmPasswordFieldKey => _confirmPasswordFieldKey;

  final _emailTextController = TextEditingController();
  TextEditingController get emailTextController => _emailTextController;

  final _passwordTextController = TextEditingController();
  TextEditingController get passwordTextController => _passwordTextController;

  final _confirmPasswordTextController = TextEditingController();
  TextEditingController get confirmPasswordTextController =>
      _confirmPasswordTextController;

  FirebaseAuth auth = FirebaseAuth.instance;

  disposeControllers() {
    emailTextController.dispose();
    passwordTextController.dispose();
    confirmPasswordTextController.dispose();
  }

  bool emailIsEmpty() {
    return emailTextController.text.isEmpty;
  }

  bool emailIsValid() {
    return emailTextController.text.contains('@') &&
        emailTextController.text.contains('.');
  }

  bool passwordIsLongEnough() {
    return passwordTextController.text.length >= 8;
  }

  bool bothPasswordsMatch() {
    return passwordTextController.text == confirmPasswordTextController.text;
  }

  bool allEntriesAreValid() {
    return !emailIsEmpty() &&
        emailIsValid() &&
        passwordIsLongEnough() &&
        bothPasswordsMatch();
  }

  createUser(String email, String password) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
