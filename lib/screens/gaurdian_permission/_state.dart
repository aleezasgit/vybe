part of 'guardian_permissions.dart';

class _ScreenState extends ChangeNotifier {
  bool showAsActive = true;
  bool liveLocation = true;
  bool automaticSos = true;
  bool nightlifeHistory = true;

  void toggleShowAsActive(bool val) { showAsActive = val; notifyListeners(); }
  void toggleLiveLocation(bool val) { liveLocation = val; notifyListeners(); }
  void toggleAutomaticSos(bool val) { automaticSos = val; notifyListeners(); }
  void toggleNightlifeHistory(bool val) { nightlifeHistory = val; notifyListeners(); }
}