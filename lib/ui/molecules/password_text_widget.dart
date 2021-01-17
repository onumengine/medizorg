import 'package:flutter/material.dart';

class PasswordTextWidget extends StatelessWidget {
  String hintText;
  GlobalKey key;
  TextEditingController controller;
  bool obscureText, autocorrect;
  Iterable<String> autofillHints;
  String enteredText;
  IconData iconData = Icons.visibility_off_rounded;

  PasswordTextWidget({
    this.key,
    this.hintText,
    this.controller,
    this.autocorrect = false,
    this.obscureText = false,
    this.autofillHints,
  }) : enteredText = controller.text;

  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              controller: this.controller,
              obscureText: this.obscureText,
              autofillHints: this.autofillHints,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration.collapsed(
                hintText: this.hintText,
                hintStyle: TextStyle(
                  color: Colors.black26,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              onTap: () {
                changeVisibility();
              },
              child: Icon(this.iconData),
            ),
          ),
        ],
      ),
    );
  }

  void changeVisibility() {
    setState() {
      if (this.obscureText == true) {
        this.obscureText = false;
        this.iconData = Icons.visibility_rounded;
      } else {
        this.obscureText = true;
        this.iconData = Icons.visibility_off_rounded;
      }
    }
  }
}
