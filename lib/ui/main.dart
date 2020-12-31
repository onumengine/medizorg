import 'package:flutter/material.dart';
import 'package:medizorg/ui/pages/sign_up_page.dart';
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
        '/': (context) => HomePage(),
        '/sign_up_page': (context) => SignUpPage(),
      },
    );
  }
}
