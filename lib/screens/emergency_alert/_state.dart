part of 'emergency_alert.dart';

class _ScreenState extends ChangeNotifier {
  bool shareLiveLocation = true;

  void toggleShareLocation(bool val) {
    shareLiveLocation = val;
    notifyListeners();
  }
}