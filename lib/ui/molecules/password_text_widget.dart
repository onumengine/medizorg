import 'package:flutter/material.dart';
import 'package:medizorg/blocs/organisms/sign_in_form_bloc.dart';
import 'package:provider/provider.dart';

class PasswordTextWidget extends StatefulWidget {
  String hintText;
  GlobalKey key;
  TextEditingController controller;
  bool obscureText, autocorrect;
  Iterable<String> autofillHints;
  String enteredText;
  IconData iconData;

  PasswordTextWidget({
    this.key,
    this.hintText,
    this.controller,
    this.autocorrect = false,
    this.obscureText = false,
    this.autofillHints,
    this.iconData,
  }) : enteredText = controller.text;

  _PasswordTextWidgetState createState() => _PasswordTextWidgetState();
}

class _PasswordTextWidgetState extends State<PasswordTextWidget> {
  Widget build(BuildContext context) {
    SignInFormBloc bloc = Provider.of<SignInFormBloc>(context);
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
              controller: widget.controller,
              obscureText: bloc.obscureText,
              autofillHints: widget.autofillHints,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration.collapsed(
                hintText: widget.hintText,
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
                bloc.changeVisibility();
              },
              child: Icon(bloc.visibilityIcon),
            ),
          ),
        ],
      ),
    );
  }
}
