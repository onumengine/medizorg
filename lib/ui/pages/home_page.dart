import 'package:flutter/material.dart';
import 'package:medizorg/ui/organisms/welcome_div.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: WelcomeDiv(),
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
