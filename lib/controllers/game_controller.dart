import 'package:flutter/material.dart';
import '../data/story_data.dart';
import '../models/story_choice.dart';
import '../models/story_node.dart';

class GameController extends ChangeNotifier {
  static const int maxHealth = 3;

  String _currentNodeId = 'start';
  int _health = maxHealth;

  String? _eventText;
  String? _pendingNodeId;
  StoryChoice? _pendingChoice;
  bool _showingEventScreen = false;

  final List<String> _decisionLog = [];

  StoryNode get currentNode => storyData[_currentNodeId]!;
  int get health => _health;

  String? get eventText => _eventText;
  StoryChoice? get pendingChoice => _pendingChoice;
  bool get showingEventScreen => _showingEventScreen;

  List<String> get decisionLog => List.unmodifiable(_decisionLog);

  void makeChoice(StoryChoice choice) {
    _pendingChoice = choice;
    _decisionLog.add(choice.text);

    _health = (_health + choice.healthChange).clamp(0, maxHealth).toInt();
    _eventText = choice.resultText;
    _pendingNodeId = _health <= 0 ? 'gameOver' : choice.nextNodeId;
    _showingEventScreen = true;

    notifyListeners();
  }

  void advanceFromEvent() {
    if (_pendingNodeId == null) return;

    _currentNodeId = _pendingNodeId!;
    _pendingNodeId = null;
    _pendingChoice = null;
    _eventText = null;
    _showingEventScreen = false;

    notifyListeners();
  }

  void restartGame() {
    _currentNodeId = 'start';
    _health = maxHealth;
    _eventText = null;
    _pendingNodeId = null;
    _pendingChoice = null;
    _showingEventScreen = false;
    _decisionLog.clear();

    notifyListeners();
  }
}