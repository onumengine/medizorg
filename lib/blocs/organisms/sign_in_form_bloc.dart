import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  void signInUser(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
