import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:medizorg/blocs/pages/video_chat_page_bloc.dart';
import 'package:provider/provider.dart';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    var viewModel = context.watch<VideoChatPageBloc>();
    return Scaffold(
      body: Container(),
    );
  }
}
