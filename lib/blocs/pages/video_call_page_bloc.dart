import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:medizorg/utils/app_id.dart';
import 'package:medizorg/utils/strings.dart';

class VideoCallPageBloc extends ChangeNotifier {
  // State variable declaration
  var _appId = appID;
  dynamic get appId => _appId;

  // State variable declaration
  String _channelName;
  String get channelName => _channelName;
  set channelName(String value) {
    _channelName = value;
    notifyListeners();
  }

  // State variable declaration
  ClientRole _clientRole;
  ClientRole get clientRole => _clientRole;
  set role(ClientRole value) {
    _clientRole = value;
    notifyListeners();
  }

  // State variable declaration
  var _listOfParticipants = <int>[];
  List<int> get listOfParticipants => _listOfParticipants;
  set listOfParticipants(List<int> value) {
    _listOfParticipants = value;
    notifyListeners();
  }

  // State variable declaration
  var _callLogs = <String>[];
  List<String> get callLogs => _callLogs;
  set callLogs(List<String> value) {
    _callLogs = value;
    notifyListeners();
  }

  // State variable declaration
  bool _callIsMuted = false;
  bool get callIsMuted => _callIsMuted;
  set callIsMuted(bool value) {
    _callIsMuted = value;
    notifyListeners();
  }

  // State variable declaration
  RtcEngine _engine;
  RtcEngine get engine => _engine;
  set engine(RtcEngine value) {
    _engine = value;
    notifyListeners();
  }

  /*
    METHOD DEFINITIONS START HERE
  */

  // Method definition
  void destroySDK() {
    engine.leaveChannel();
    engine.destroy();
  }

  // Method definition
  Future<void> initialize() async {
    if (appId.isEmpty) {
      callLogs..add(FEEDBACK_APP_ID_MISSING)..add(FEEDBACK_AGORA_NOT_STARTING);
      return;
    }
    await _initEngine();
    _addEventHandlers();
    VideoEncoderConfiguration configuration = VideoEncoderConfiguration();
    configuration.dimensions = VideoDimensions(1920, 1080);
    await _engine.setVideoEncoderConfiguration(configuration);
    await _engine.joinChannel(null, channelName, null, 0);
  }

  // Create and initialize the RtcEngine
  // Method definition
  Future<void> _initEngine() async {
    _engine = await RtcEngine.create(appID);
    await _engine.enableVideo();
    await _engine.enableWebSdkInteroperability(true);
    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await _engine.setClientRole(clientRole);
  }

  // Add event handlers to the RtcEngine
  // Method definition
  void _addEventHandlers() {
    _engine.setEventHandler(
      RtcEngineEventHandler(
        error: (code) {
          final info = 'onError: $code';
          _callLogs.add(info);
        },
        joinChannelSuccess: (channel, uid, elapsed) {
          final info = 'onJoinChannel: $channel, uid: $uid';
          _callLogs.add(info);
        },
        leaveChannel: (stats) {
          _callLogs.add('onLeaveChannel');
          _listOfParticipants.clear();
        },
        userJoined: (uid, elapsed) {
          final info = 'userJoined: $uid';
          _callLogs.add(info);
          _listOfParticipants.add(uid);
        },
        userOffline: (uid, elapsed) {
          final info = 'userOffline: $uid';
          _callLogs.add(info);
          _listOfParticipants.remove(uid);
        },
        firstRemoteVideoFrame: (uid, width, height, elapsed) {
          final info = 'firstRemoteVideo: $uid $width x $height';
          _callLogs.add(info);
        },
      ),
    );
  }

  // Generate a screen for each client
  // Method definition
  List<Widget> getRenderViews() {
    final List<StatefulWidget> renderViews = [];
    if (clientRole == ClientRole.Broadcaster) {
      renderViews.add(RtcLocalView.SurfaceView());
    }
    listOfParticipants.forEach(
      (int userId) => renderViews.add(RtcRemoteView.SurfaceView(uid: userId)),
    );
    return renderViews;
  }

  exitVideoCall() {
    destroySDK();
  }

  toggleMute() {
    _callIsMuted = !_callIsMuted;
    _engine.muteLocalAudioStream(_callIsMuted);
  }

  switchCamera() {
    _engine.switchCamera();
  }
}
