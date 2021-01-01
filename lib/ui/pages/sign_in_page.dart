import 'package:flutter/material.dart';
import 'package:medizorg/ui/organisms/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SignInForm(),
        ),
      ),
    );
  }
}
