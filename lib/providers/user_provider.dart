import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _username = 'user1';
  String get username => _username;
  set username(String newString) {
    _username = newString;
    notifyListeners();
  }

  String _password = 'user1';
  String get password => _password;
  set password(String newString) {
    _password = newString;
    notifyListeners();
  }
}
