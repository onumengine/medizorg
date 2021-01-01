import 'package:flutter/material.dart';

class WelcomeDiv extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Welcome',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 30.0,
            ),
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Row(
          children: <Widget>[
            Text(
              'to ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 30.0,
              ),
            ),
            Text(
              'Medizorg',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontSize: 30.0,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
            'Official Public Service Announcement on Coronavirus from the World Health Organization',
            style: TextStyle(
              color: Colors.black38,
            )),
      ],
    );
  }
}
