import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:medizorg/blocs/pages/video_call_page_bloc.dart';
import 'package:medizorg/ui/organisms/video_call_layout.dart';
import 'package:medizorg/ui/organisms/video_call_panel.dart';
import 'package:medizorg/ui/organisms/video_call_toolbar.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';

class VideoCallPage extends StatefulWidget {
  final String channelName;

  /*
   This variable stands for the type of client that is joining the video chat. The client can either be the host or a guest
   If the client is the host, the value of this variable will be ClientRole.Broadcaster and if the  client is a guest,
   the value of this variable will be ClientRole.Audience
  */
  final ClientRole clientRole;

  VideoCallPage({Key key, this.channelName, this.clientRole});

  _VideoCallPageState createState() => _VideoCallPageState();
}

class _VideoCallPageState extends State<VideoCallPage> {
  var cameraPermissionStatus, microphonePermissionStatus;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> requestPermissions() async {
    cameraPermissionStatus = await Permission.camera.request();
    microphonePermissionStatus = await Permission.microphone.request();
  }

  Widget build(BuildContext context) {
    var viewModel = context.watch<VideoCallPageBloc>();
    viewModel.initialize();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: <Widget>[
              VideoCallLayout(),
              VideoCallPanel(),
              VideoCallToolbar(),
            ],
          ),
        ),
      ),
    );
  }
}
