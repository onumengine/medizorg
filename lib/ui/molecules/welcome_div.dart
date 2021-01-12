import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class WelcomeDiv extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            WELCOME,
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
              TO,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 30.0,
              ),
            ),
            Text(
              MEDIZORG,
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
        Text(PUBLIC_SERVICE_ANNOUNCEMENT,
            style: TextStyle(
              color: Colors.black38,
            )),
      ],
    );
  }
}
