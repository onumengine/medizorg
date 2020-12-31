import 'package:flutter/material.dart';

class DoctorRegistrationPage extends StatefulWidget {
  _DoctorRegistrationPageState createState() => _DoctorRegistrationPageState();
}

class _DoctorRegistrationPageState extends State<DoctorRegistrationPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            CircleAvatar(
              radius: (MediaQuery.of(context).size.height) / 15,
              child: Icon(Icons.wallet_travel_sharp),
              backgroundColor: Colors.blueGrey,
              foregroundColor: Colors.white,
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  onPressed: () {},
                  child: Text('Back'),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text('Next'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
