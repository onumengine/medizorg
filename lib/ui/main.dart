import 'package:flutter/material.dart';
import 'package:medizorg/ui/pages/doctor_registration_page.dart';
import 'package:medizorg/ui/pages/sign_in_page.dart';
import 'package:medizorg/ui/pages/sign_up_page.dart';
import 'package:medizorg/ui/pages/welcome_page.dart';
import 'package:medizorg/ui/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => WelcomePage(),
        '/sign_in_page': (context) => SignInPage(),
        '/sign_up_page': (context) => SignUpPage(),
        '/doctor_registration_page': (context) => DoctorRegistrationPage(),
        '/home_page': (context) => HomePage(),
      },
    );
  }
}
