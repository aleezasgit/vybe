part of 'emergency.dart';

class _ScreenState extends ChangeNotifier {
  bool isMuted = false;
  bool isSpeaker = false;

  void toggleMute() {
    isMuted = !isMuted;
    notifyListeners();
  }

  void toggleSpeaker() {
    isSpeaker = !isSpeaker;
    notifyListeners();
  }
}