import 'package:flutter/material.dart';
import 'package:medizorg/ui/molecules/text_widget.dart';
import 'package:medizorg/utils/strings.dart';
import 'package:medizorg/blocs/organisms/sign_in_form_bloc.dart';
import 'package:provider/provider.dart';

class SignInForm extends StatefulWidget {
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    final SignInFormBloc signInFormBloc = Provider.of<SignInFormBloc>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Text>[
              Text(
                TEXT_SIGN,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30.0,
                ),
              ),
              Text(
                TEXT_IN,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              TEXT_ENTER_CREDENTIALS,
              style: TextStyle(color: Colors.black45),
            ),
          ),
          TextWidget(
            hintText: HINT_TEXT_EMAIL,
            key: signInFormBloc.emailFieldKey,
            controller: signInFormBloc.emailController,
          ),
          SizedBox(
            height: 20.0,
          ),
          TextWidget(
            hintText: HINT_TEXT_PASSWORD,
            key: signInFormBloc.passwordFieldKey,
            controller: signInFormBloc.passwordController,
            obscureText: true,
            autocorrect: false,
          ),
          SizedBox(
            height: 4.0,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              TEXT_FORGOT_PASSWORD,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 50.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
            ),
            child: TextButton(
              onPressed: () {
                signInFormBloc.getSuccessStatus(context);
              },
              child: Text(
                TEXT_SIGN_IN_UPPERCASE,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                TEXT_DONT_HAVE_AN_ACCOUNT,
                style: TextStyle(color: Colors.black38),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(ROUTE_SIGN_UP_PAGE);
                },
                child: Text(
                  TEXT_SIGN_UP_UPPERCASE,
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
