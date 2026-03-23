part of 'add_new_guardian.dart';

enum RelationshipType { bestFriend, family, partner, colleague }

class _ScreenState extends ChangeNotifier {
  RelationshipType selectedRelation = RelationshipType.bestFriend;

  bool shareLocation = true;
  bool sosAlerts = true;
  bool nightlifeHistory = true;

  void selectRelation(RelationshipType type) {
    selectedRelation = type;
    notifyListeners();
  }

  void toggleLocation(bool val) {
    shareLocation = val;
    notifyListeners();
  }

  void toggleSos(bool val) {
    sosAlerts = val;
    notifyListeners();
  }

  void toggleHistory(bool val) {
    nightlifeHistory = val;
    notifyListeners();
  }

  void onConfirm() {
    debugPrint('Guardian Confirmed');
  }
}