import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medizorg/utils/strings.dart';

class AuthValidationPage extends StatefulWidget {
  _AuthValidationPageState createState() => _AuthValidationPageState();
}

class _AuthValidationPageState extends State<AuthValidationPage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    if (auth.currentUser == null) {
      Navigator.pop(context);
    } else {
      Navigator.of(context).pushNamed(ROUTE_HOME_PAGE);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
