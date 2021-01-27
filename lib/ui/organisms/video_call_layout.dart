import 'package:flutter/material.dart';
import 'package:medizorg/blocs/pages/video_call_page_bloc.dart';
import 'package:medizorg/ui/molecules/video_row.dart';
import 'package:medizorg/ui/molecules/video_view.dart';
import 'package:provider/provider.dart';

class VideoCallLayout extends StatefulWidget {
  _VideoCallLayoutState createState() => _VideoCallLayoutState();
}

class _VideoCallLayoutState extends State<VideoCallLayout> {
  Widget build(BuildContext context) {
    var videoCallPageBloc = context.watch<VideoCallPageBloc>();
    final views = videoCallPageBloc.getRenderViews();

    switch (views.length) {
      case 1:
        return Container(
          child: Column(
            children: <Widget>[
              VideoView(views[0]),
            ],
          ),
        );
      case 2:
        return Container(
          child: Column(
            children: <Widget>[
              VideoRow([views[0]]),
              VideoRow([views[1]]),
            ],
          ),
        );
      case 3:
        return Container(
          child: Column(
            children: <Widget>[
              VideoRow(
                views.sublist(0, 2),
              ),
              VideoRow(
                views.sublist(2, 3),
              ),
            ],
          ),
        );
      case 4:
        return Container(
          child: Column(
            children: <Widget>[
              VideoRow(
                views.sublist(0, 2),
              ),
              VideoRow(
                views.sublist(2, 4),
              ),
            ],
          ),
        );
      default:
    }
    return Container();
  }
}
