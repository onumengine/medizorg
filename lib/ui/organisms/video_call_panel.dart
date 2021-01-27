import 'package:flutter/material.dart';
import 'package:medizorg/blocs/pages/video_call_page_bloc.dart';
import 'package:provider/provider.dart';

class VideoCallPanel extends StatefulWidget {
  _VideoCallPanelState createState() => _VideoCallPanelState();
}

class _VideoCallPanelState extends State<VideoCallPanel> {

  Widget build(BuildContext context) {

    var viewModel = context.watch<VideoCallPageBloc>();

    return Container(
      padding: EdgeInsets.symmetric(vertical: 48),
      alignment: Alignment.bottomCenter,
      child: FractionallySizedBox(
        heightFactor: 0.5,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 48),
          child: ListView.builder(
            reverse: true,
            itemCount: viewModel.callLogs.length,
            itemBuilder: (BuildContext context, int index) {
              if (viewModel.callLogs.isEmpty) {
                return null;
              }
              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 3.0,
                  horizontal: 10.0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 2.0,
                          horizontal: 5.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.yellowAccent,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Text(
                          viewModel.callLogs[index],
                          style: TextStyle(
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}