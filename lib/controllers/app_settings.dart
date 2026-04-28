import 'package:flutter/material.dart';
import '../services/audio_service.dart';

class AppSettings extends ChangeNotifier {
  bool _isDarkMode = true;
  bool _soundOn = true;

  bool get isDarkMode => _isDarkMode;
  bool get soundOn => _soundOn;

  void toggleTheme(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  Future<void> toggleSound(bool value) async {
    _soundOn = value;
    await AudioService.instance.setSoundEnabled(value);
    notifyListeners();
  }
}