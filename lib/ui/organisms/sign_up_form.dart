import 'package:flutter/material.dart';
import 'package:medizorg/ui/molecules/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medizorg/utils/constants.dart';

class SignUpForm extends StatefulWidget {
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _emailFieldKey = GlobalKey<FormState>();
  final _passwordFieldKey = GlobalKey<FormState>();
  final _confirmPasswordFieldKey = GlobalKey<FormState>();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    confirmPasswordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            key: _emailFieldKey,
            controller: emailTextController,
          ),
          SizedBox(
            height: 20.0,
          ),
          TextWidget(
            hintText: HINT_TEXT_PASSWORD,
            key: _passwordFieldKey,
            controller: passwordTextController,
            obscureText: true,
            autocorrect: false,
          ),
          SizedBox(
            height: 20.0,
          ),
          TextWidget(
            hintText: HINT_TEXT_CONFIRM_PASSWORD,
            key: _confirmPasswordFieldKey,
            controller: confirmPasswordTextController,
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
                createUser(
                  emailTextController.text,
                  passwordTextController.text,
                );
                Navigator.of(context).pushNamed(ROUTE_HOME_PAGE);
              },
              child: Text(
                TEXT_SIGN_UP,
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

  void createUser(String email, String password) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == ERROR_MESSAGE_WEAK_PASSWORD) {
        print('The password provided is too weak.');
      } else if (e.code == ERROR_MESSAGE_EMAIL_ALREADY_USED) {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
