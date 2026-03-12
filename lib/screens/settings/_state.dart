part of 'settings.dart';

class _ScreenState extends ChangeNotifier {
  bool shareLocation = true;
  bool ghostCheckInMode = false;

  void toggleShareLocation(bool val) {
    shareLocation = val;
    notifyListeners();
  }

  void toggleGhostCheckIn(bool val) {
    ghostCheckInMode = val;
    notifyListeners();
  }
}