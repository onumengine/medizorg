import 'package:flutter/material.dart';

class FilledIconButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      width: 20.0,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
      child: GestureDetector(
        child: Icon(Icons.search_rounded),
        onTap: () {
          print('pressed search');
        },
      ),
    );
  }
}
