import 'package:flutter/material.dart';

class VideoView extends StatefulWidget {
  
  var view;

  VideoView(this.view);

  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: widget.view,
      ),
    );
  }
}
