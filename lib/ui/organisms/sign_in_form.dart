import 'package:flutter/material.dart';
import 'package:medizorg/ui/molecules/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medizorg/utils/constants.dart';

class SignInForm extends StatefulWidget {
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _emailFieldKey = GlobalKey<FormState>();
  final _passwordFieldKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Text>[
              Text(
                'Sign ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30.0,
                ),
              ),
              Text(
                'In',
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
              'Please enter your credentials to proceed',
              style: TextStyle(color: Colors.black45),
            ),
          ),
          TextWidget(
            hintText: 'Email',
            key: _emailFieldKey,
            controller: emailController,
          ),
          SizedBox(
            height: 20.0,
          ),
          TextWidget(
            hintText: 'Password',
            key: _passwordFieldKey,
            controller: passwordController,
            obscureText: true,
            autocorrect: false,
          ),
          SizedBox(
            height: 4.0,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Forgot Password?',
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
                if (validateForm(
                  emailController.text,
                  passwordController.text,
                )) {
                  signInUser(emailController.text, passwordController.text);
                  Navigator.of(context).pushNamed('/home_page');
                } else {
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("You have to enter valid content")));
                }
              },
              child: Text(
                'SIGN IN',
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
                'Don\'t have an account?',
                style: TextStyle(color: Colors.black38),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/sign_up_page');
                },
                child: Text(
                  'SIGN UP',
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  bool emailIsValid(String email) {
    return (email.contains("@"));
  }

  bool passwordIsValid(String password) {
    return (password.length >= 8);
  }

  bool validateForm(String email, String password) {
    return (emailIsValid(email) && passwordIsValid(password));
  }

  void signInUser(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == USER_NOT_FOUND_ERROR_CODE) {
        print('No user found for that email.');
      } else if (e.code == WRONG_PASSWORD_ERROR_CODE) {
        print('Wrong password provided for that user.');
      }
    }
  }
}
