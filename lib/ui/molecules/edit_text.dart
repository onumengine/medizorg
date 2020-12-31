import 'package:flutter/material.dart';

class EditText extends StatelessWidget {
  String labelText;
  dynamic Function(String) validator;
  GlobalKey<FormState> key;
  bool obscureText;
  bool autofillHints;
  bool autocorrect;

  EditText(
      {this.labelText,
      this.validator,
      @required this.key,
      this.obscureText = false,
      this.autocorrect = false,
      this.autofillHints = true});

  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black12,
          labelText: this.labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide: BorderSide(
              color: Colors.black12,
              style: BorderStyle.solid,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide: BorderSide(
              color: Colors.black12,
              style: BorderStyle.solid,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide: BorderSide(
              color: Colors.black12,
              style: BorderStyle.none,
            ),
          ),
        ),
        validator: this.validator,
      ),
    );
  }
}
