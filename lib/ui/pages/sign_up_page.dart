import 'package:flutter/material.dart';
import 'package:medizorg/ui/organisms/sign_up_form.dart';
import 'package:medizorg/blocs/organisms/sign_up_form_bloc.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpFormBloc>.value(
      value: SignUpFormBloc(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}
