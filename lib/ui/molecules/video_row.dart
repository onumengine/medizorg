import 'package:flutter/material.dart';
import 'package:medizorg/ui/molecules/video_view.dart';

class VideoRow extends StatefulWidget {
  List<Widget> views;

  VideoRow(this.views);

  _VideoRowState createState() => _VideoRowState();
}

class _VideoRowState extends State<VideoRow> {
  Widget build(BuildContext context) {
    final wrappedViews = widget.views.map<Widget>((element) => VideoView(element)).toList();
    return Expanded(
      child: Row(
        children: wrappedViews,
      ),
    );
  }
}
