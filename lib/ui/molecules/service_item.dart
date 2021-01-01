import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  IconData iconData;
  String text;

  ServiceItem({this.iconData, this.text});

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(this.iconData),
          Text(this.text),
        ],
      ),
    );
  }
}
