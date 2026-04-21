import 'story_choice.dart';

class StoryNode {
  final String id;
  final String title;
  final String description;
  final List<StoryChoice> choices;
  final bool isEnding;

  const StoryNode({
    required this.id,
    required this.title,
    required this.description,
    required this.choices,
    this.isEnding = false,
  });
}