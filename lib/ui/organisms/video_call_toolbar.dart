import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:medizorg/blocs/pages/video_call_page_bloc.dart';
import 'package:provider/provider.dart';

class VideoCallToolbar extends StatefulWidget {

  _VideoCallToolbarState createState() => _VideoCallToolbarState();
}

class _VideoCallToolbarState extends State<VideoCallToolbar> {
  // I HAVE A FEELING THAT SINCE I'M ACCESSING THE SAME PROVIDER MULTIPLE TIMES IN THE WIDGET TREE, MY WIDGET TREE MAY BE
  // DOING SOME EXTRA REBUILDING EVERY TIME THE BUILD METHOD IS CALLED AND THE APP IS REBUILT
  Widget build(BuildContext context) {
    var videoChatPageBloc = context.watch<VideoCallPageBloc>();
    return (videoChatPageBloc.clientRole == ClientRole.Audience)
        ? Container()
        : Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(vertical: 48.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RawMaterialButton(
                  onPressed: videoChatPageBloc.toggleMute,
                  child: Icon(
                    videoChatPageBloc.callIsMuted ? Icons.mic_off_rounded : Icons.mic_rounded,
                    color: videoChatPageBloc.callIsMuted ? Colors.white : Colors.blueAccent,
                    size: 20.0,
                  ),
                  shape: CircleBorder(),
                  elevation: 2.0,
                  fillColor: videoChatPageBloc.callIsMuted ? Colors.white : Colors.blueAccent,
                  padding: EdgeInsets.all(12.0),
                ),
                RawMaterialButton(
                  onPressed: videoChatPageBloc.exitVideoCall,
                  child: Icon(
                    Icons.call_end_rounded,
                    color: Colors.white,
                    size: 35.0,
                  ),
                  shape: CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.redAccent,
                  padding: EdgeInsets.all(15.0),
                ),
                RawMaterialButton(
                  onPressed: videoChatPageBloc.switchCamera,
                  child: Icon(
                    Icons.switch_camera_rounded,
                    color: Colors.blueAccent,
                    size: 20.0,
                  ),
                  shape: CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  padding: EdgeInsets.all(12.0),
                ),
              ],
            ),
          );
  }
}
