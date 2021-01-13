import 'package:flutter/material.dart';
import 'package:medizorg/ui/organisms/sign_in_form.dart';
import 'package:provider/provider.dart';
import 'package:medizorg/blocs/organisms/sign_in_form_bloc.dart';

class SignInPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignInFormBloc>.value(
      value: SignInFormBloc(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: SignInForm(),
          ),
        ),
      ),
    );
  }
}
