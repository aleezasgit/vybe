part of 'data_visibility.dart';

enum ProfilePrivacy { everyone, friends, onlyMe }

class _ScreenState extends ChangeNotifier {
  bool showAsActive = true;
  bool showWhenOnline = true;
  ProfilePrivacy selectedPrivacy = ProfilePrivacy.everyone;

  void toggleShowAsActive(bool val) {
    showAsActive = val;
    notifyListeners();
  }

  void toggleShowWhenOnline(bool val) {
    showWhenOnline = val;
    notifyListeners();
  }

  void selectPrivacy(ProfilePrivacy val) {
    selectedPrivacy = val;
    notifyListeners();
  }
}