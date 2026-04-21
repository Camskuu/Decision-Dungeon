class StoryChoice {
  final String text;
  final String nextNodeId;
  final int healthChange;
  final String resultText;

  const StoryChoice({
    required this.text,
    required this.nextNodeId,
    required this.resultText,
    this.healthChange = 0,
  });
}