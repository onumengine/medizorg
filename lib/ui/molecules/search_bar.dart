import 'package:flutter/material.dart';
import 'package:medizorg/ui/atoms/filled_icon_button.dart';

class SearchBar extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration.collapsed(
                hintText: 'Search doctors',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FilledIconButton(),
          ),
        ],
      ),
    );
  }
}
