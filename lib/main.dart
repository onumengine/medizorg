import 'package:flutter/material.dart';
import 'package:medizorg/ui/pages/doctor_registration_page.dart';
import 'package:medizorg/ui/pages/sign_in_page.dart';
import 'package:medizorg/ui/pages/sign_up_page.dart';
import 'package:medizorg/ui/pages/welcome_page.dart';
import 'package:medizorg/ui/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _firebaseApp,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return MaterialApp(
            home: Center(
              child: Text("Unable to create FirebaseApp"),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.red,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: WelcomePage(),
            routes: {
              '/sign_in_page': (context) => SignInPage(),
              '/sign_up_page': (context) => SignUpPage(),
              '/doctor_registration_page': (context) =>
                  DoctorRegistrationPage(),
              '/home_page': (context) => HomePage(),
            },
          );
        }

        return MaterialApp(
          home: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
