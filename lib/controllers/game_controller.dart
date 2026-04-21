import 'package:flutter/material.dart';
import '../data/story_data.dart';
import '../models/story_choice.dart';
import '../models/story_node.dart';

class GameController extends ChangeNotifier {
  static const int maxHealth = 3;

  String _currentNodeId = 'start';
  int _health = maxHealth;
  String? _lastResult;
  final List<String> _decisionLog = [];

  StoryNode get currentNode => storyData[_currentNodeId]!;
  int get health => _health;
  String? get lastResult => _lastResult;
  List<String> get decisionLog => List.unmodifiable(_decisionLog);

  void makeChoice(StoryChoice choice) {
    _health = (_health + choice.healthChange).clamp(0, maxHealth).toInt();
    _lastResult = choice.resultText;
    _decisionLog.add(choice.text);

    if (_health <= 0) {
      _currentNodeId = 'gameOver';
    } else {
      _currentNodeId = choice.nextNodeId;
    }

    notifyListeners();
  }

  void restartGame() {
    _currentNodeId = 'start';
    _health = maxHealth;
    _lastResult = null;
    _decisionLog.clear();
    notifyListeners();
  }
}