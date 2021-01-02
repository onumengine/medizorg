import 'package:flutter/material.dart';
import 'package:medizorg/ui/organisms/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SignUpForm(),
        ),
      ),
    );
  }
}
