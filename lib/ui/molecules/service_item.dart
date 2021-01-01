import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            Icon(Icons.contact_mail_outlined),
            Text('Doctor'),
          ],
        ),
      ),
    );
  }
}
