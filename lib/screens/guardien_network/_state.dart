part of 'guardian_network.dart';

class _ScreenState extends ChangeNotifier {
  bool shareLiveLocation = true;
  bool sosEnabled = true;

  void toggleShareLocation(bool value) {
    shareLiveLocation = value;
    notifyListeners();
  }

  void toggleSos(bool value) {
    sosEnabled = value;
    notifyListeners();
  }

  void onAddGuardian() {
    // TODO: Navigate or open modal
    debugPrint('Add Guardian tapped');
  }
}