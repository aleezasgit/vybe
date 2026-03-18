part of 'data_privacy.dart';

class _ScreenState extends ChangeNotifier {
  bool liveLocationSharing = true;

  void toggleLiveLocation(bool val) {
    liveLocationSharing = val;
    notifyListeners();
  }
}