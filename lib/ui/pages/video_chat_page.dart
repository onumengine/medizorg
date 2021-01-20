import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

class VideoChatPage extends StatefulWidget {
  final String channelName;

  /*
   This variable stands for the type of client that is joining the video chat. The client can either be the host or a guest
   If the client is the host, the value of this variable will be ClientRole.Broadcaster and if the  client is a guest,
   the value of this variable will be ClientRole.Audience
  */
  final ClientRole clientRole;

  VideoChatPage({Key key, this.channelName, this.clientRole});

  _VideoChatPageState createState() => _VideoChatPageState();
}

class _VideoChatPageState extends State<VideoChatPage> {
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
