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
                  key: _confirmPasswordFieldKey,
                  obscureText: true,
                  autocorrect: false,
                  labelText: 'Confirm password',
                  validator: (String value) {
                    return (value.isEmpty)
                        ? 'Please enter your password'
                        : null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.black,
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
                    color: Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      print('pressed me');
                    },
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
