import 'package:flutter/material.dart';
import 'package:medizorg/ui/molecules/text_widget.dart';
import 'package:medizorg/utils/strings.dart';
import 'package:medizorg/blocs/organisms/sign_up_form_bloc.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatefulWidget {
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    final SignUpFormBloc signUpFormBloc = Provider.of<SignUpFormBloc>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: (MediaQuery.of(context).size.height) / 9,
          ),
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
                TEXT_UP,
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
            key: signUpFormBloc.emailFieldKey,
            controller: signUpFormBloc.emailTextController,
          ),
          SizedBox(
            height: 20.0,
          ),
          TextWidget(
            hintText: HINT_TEXT_PASSWORD,
            key: signUpFormBloc.passwordFieldKey,
            controller: signUpFormBloc.passwordTextController,
            obscureText: true,
            autocorrect: false,
          ),
          SizedBox(
            height: 20.0,
          ),
          TextWidget(
            hintText: HINT_TEXT_CONFIRM_PASSWORD,
            key: signUpFormBloc.confirmPasswordFieldKey,
            controller: signUpFormBloc.confirmPasswordTextController,
            obscureText: true,
            autocorrect: false,
          ),
          SizedBox(
            height: 4.0,
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
                signUpFormBloc.createUser(
                  signUpFormBloc.emailTextController.text,
                  signUpFormBloc.passwordTextController.text,
                );
                Navigator.of(context).pushNamed(ROUTE_HOME_PAGE);
              },
              child: Text(
                TEXT_SIGN_UP_UPPERCASE,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: IconButton(
              icon: Icon(Icons.call_to_action_rounded),
              onPressed: () {
                Navigator.of(context).pushNamed(ROUTE_DOCTOR_REG_PAGE);
              },
            ),
          ),
        ],
      ),
    );
  }
}
