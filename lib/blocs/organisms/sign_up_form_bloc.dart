import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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

  FirebaseAuth _auth = FirebaseAuth.instance;
}
