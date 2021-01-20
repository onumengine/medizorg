import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Center(
        child: Container(
          height: 30.0,
          width: MediaQuery.of(context).size.width - 30,
          color: Colors.black,
        ),
      ),
    );
  }
}
