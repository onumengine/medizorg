import 'package:flutter/material.dart';

class NotifScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Container(
          height: 30.0,
          width: MediaQuery.of(context).size.width - 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
