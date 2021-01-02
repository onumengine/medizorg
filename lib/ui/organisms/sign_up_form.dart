import 'package:flutter/material.dart';
import 'package:medizorg/ui/molecules/edit_text.dart';

class SignUpForm extends StatefulWidget {
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailFieldKey = GlobalKey<FormState>();
  final _passwordFieldKey = GlobalKey<FormState>();
  final _confirmPasswordFieldKey = GlobalKey<FormState>();

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
                EditText(
                  labelText: 'Email',
                  key: _emailFieldKey,
                  validator: (String value) {
                    return (value.isEmpty) ? "Please enter your email" : null;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                EditText(
                  labelText: 'Password',
                  key: _passwordFieldKey,
                  obscureText: true,
                  autocorrect: false,
                  validator: (String value) {
                    return (value.isEmpty)
                        ? 'Please enter your password'
                        : null;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                EditText(
                  labelText: 'Confirm Password',
                  key: _confirmPasswordFieldKey,
                  obscureText: true,
                  autocorrect: false,
                  validator: (String value) {
                    return (value.isEmpty)
                        ? 'Please enter your password'
                        : null;
                  },
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
                      Navigator.of(context).pushNamed('/home_page');
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
                Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: FlatButton(
                      onPressed: null,
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(color: Colors.blue),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
