import 'package:flutter/material.dart';
import 'package:medizorg/ui/molecules/welcome_div.dart';
import '../../utils/constants.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
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
              SizedBox(height: 10.0),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Image.asset(DOCTOR_IMAGE_URL),
                    Positioned(
                      bottom: -15.0,
                      right: -15.0,
                      child: Container(
                        height: 80.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: GestureDetector(
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.white,
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed(SIGN_IN_PAGE_ROUTE);
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
