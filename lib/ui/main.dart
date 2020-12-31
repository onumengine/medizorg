import 'package:flutter/material.dart';
import 'package:medizorg/ui/pages/sign_up_page.dart';

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
      home: MyHomePage(),
      routes: {
        '/sign_up_page': (context) => SignUpPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text('Welcome'),
              Text('to Medizorg'),
              Text(
                'Official Public Service Announcement on Coronavirus from the World Health Organization',
              ),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Image.asset('lib/assets/doctor.png'),
                    Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward_rounded),
                        onPressed: () {
                          Navigator.pushNamed(context, '/sign_up_page');
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
