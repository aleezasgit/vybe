part of 'guardian_access.dart';

class _ScreenState extends ChangeNotifier {
  bool gpsLocation = true;
  bool sosAlerts = true;
  bool batteryAlerts = true;
  bool venueCheckIns = true;

  void toggleGps(bool val) { gpsLocation = val; notifyListeners(); }
  void toggleSos(bool val) { sosAlerts = val; notifyListeners(); }
  void toggleBattery(bool val) { batteryAlerts = val; notifyListeners(); }
  void toggleVenue(bool val) { venueCheckIns = val; notifyListeners(); }
}