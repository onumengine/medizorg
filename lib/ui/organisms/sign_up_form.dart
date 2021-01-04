import 'package:flutter/material.dart';
import 'package:medizorg/ui/molecules/text_field.dart';

class SignUpForm extends StatefulWidget {
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailFieldKey = GlobalKey<FormState>();
  final _passwordFieldKey = GlobalKey<FormState>();
  final _confirmPasswordFieldKey = GlobalKey<FormState>();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

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
                'Sign ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30.0,
                ),
              ),
              Text(
                'Up',
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
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextWidget(
                  hintText: 'Email',
                  key: _emailFieldKey,
                  controller: emailTextController,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextWidget(
                  hintText: 'Password',
                  key: _passwordFieldKey,
                  controller: passwordTextController,
                  obscureText: true,
                  autocorrect: false,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextWidget(
                  hintText: 'Confirm password',
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
                      if (_emailFieldKey.currentState.validate()) {
                        Navigator.of(context)
                            .pushNamed('/doctor_registration_page');
                      } else {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text('You must meet all criteria!'),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'SIGN UP',
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
                      Navigator.of(context)
                          .pushNamed('/doctor_registration_page');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
