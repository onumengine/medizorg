import 'package:flutter/material.dart';
import 'package:medizorg/ui/pages/doctor_registration_page.dart';
import 'package:medizorg/ui/pages/sign_in_page.dart';
import 'package:medizorg/ui/pages/sign_up_page.dart';
import 'package:medizorg/ui/pages/welcome_page.dart';
import 'package:medizorg/ui/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medizorg/utils/strings.dart';
import 'package:medizorg/ui/pages/password_recovery_page.dart';
import 'package:medizorg/ui/pages/video_chat_page.dart';

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
            home: Scaffold(
              body: Center(
                child: Text("Unable to create FirebaseApp"),
              ),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: TEXT_MEDIZORG,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.red,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: WelcomePage(),
            routes: {
              ROUTE_SIGN_IN_PAGE: (context) => SignInPage(),
              ROUTE_SIGN_UP_PAGE: (context) => SignUpPage(),
              ROUTE_PASSWORD_RECOVERY_PAGE: (context) => PasswordRecoveryPage(),
              ROUTE_DOCTOR_REG_PAGE: (context) => DoctorRegistrationPage(),
              ROUTE_HOME_PAGE: (context) => HomePage(),
              ROUTE_VIDEO_CHAT_PAGE: (context) => VideoChatPage(),
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
