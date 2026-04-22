import 'package:flutter/material.dart';

class AppSettings extends ChangeNotifier {
  bool _isDarkMode = true;
  bool _soundOn = true;

  bool get isDarkMode => _isDarkMode;
  bool get soundOn => _soundOn;

  void toggleTheme(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  void toggleSound(bool value) {
    _soundOn = value;
    notifyListeners();
  }
}