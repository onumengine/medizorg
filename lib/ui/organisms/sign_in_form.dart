import 'package:flutter/material.dart';
import 'package:medizorg/ui/molecules/text_widget.dart';
import 'package:medizorg/utils/strings.dart';
import 'package:medizorg/blocs/organisms/sign_in_form_bloc.dart';
import 'package:provider/provider.dart';
import 'package:medizorg/ui/molecules/password_text_widget.dart';

class SignInForm extends StatefulWidget {
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _emailFieldKey = GlobalKey<FormState>();
  GlobalKey<FormState> get emailFieldKey => _emailFieldKey;

  final _passwordFieldKey = GlobalKey<FormState>();
  GlobalKey<FormState> get passwordFieldKey => _passwordFieldKey;

  final _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SignInFormBloc signInFormBloc = Provider.of<SignInFormBloc>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
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
              key: emailFieldKey,
              controller: emailController,
            ),
            SizedBox(
              height: 20.0,
            ),
            PasswordTextWidget(
              hintText: HINT_TEXT_PASSWORD,
              key: passwordFieldKey,
              controller: passwordController,
            ),
            SizedBox(
              height: 4.0,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  signInFormBloc.openPage(
                      ROUTE_PASSWORD_RECOVERY_PAGE, context);
                },
                child: Text(
                  TEXT_FORGOT_PASSWORD,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
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
                  signInFormBloc.getSuccessStatus(
                    emailController.text,
                    passwordController.text,
                    context,
                  );
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
      ),
    );
  }
}
