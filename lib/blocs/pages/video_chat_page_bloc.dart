import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:medizorg/utils/app_id.dart';
import 'package:medizorg/utils/strings.dart';

class VideoChatPageBloc extends ChangeNotifier {
  String _appId = appID;
  String get appId => _appId;

  String _channelName;
  String get channelName => _channelName;
  set channelName(String value) {
    _channelName = value;
    notifyListeners();
  }

  var _listOfParticipants = <int>[];
  List<int> get listOfParticipants => _listOfParticipants;
  set listOfParticipants(List<int> value) {
    _listOfParticipants = value;
    notifyListeners();
  }

  var _callLogs = <String>[];
  List<String> get callLogs => _callLogs;
  set callLogs(List<String> value) {
    _callLogs = value;
    notifyListeners();
  }

  bool _callIsMuted = false;
  bool get callIsMuted => _callIsMuted;
  set callIsMuted(bool value) {
    _callIsMuted = value;
    notifyListeners();
  }

  RtcEngine _engine;
  RtcEngine get engine => _engine;
  set engine(RtcEngine value) {
    _engine = value;
    notifyListeners();
  }

  void destroySDK() {
    engine.leaveChannel();
    engine.destroy();
  }

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

  // CREATE AGORA SDK INSTANCE AND INITIALIZE
  Future<void> _initEngine() async {
    engine = await RtcEngine.create(appID);
    await engine.enableVideo();
    await engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await engine.setClientRole(clientRole);
  }

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
}
