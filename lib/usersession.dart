import 'package:flutter/foundation.dart';

class UserSession extends ChangeNotifier {
  String? userEmail;

  void setUserEmail(String email) {
    userEmail = email;
    notifyListeners();
  }

  void clearUser() {
    userEmail = null;
    notifyListeners();
  }
}
