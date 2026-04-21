import 'package:flutter/material.dart';
import '../controllers/game_controller.dart';
import '../models/story_choice.dart';
import '../theme/app_theme.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late final GameController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GameController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Decision Dungeon'),
        backgroundColor: Colors.black,
        foregroundColor: AppTheme.gold,
      ),
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            final node = _controller.currentNode;
            final isEnding = node.isEnding;

            return LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 850;

                final storySection = Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppTheme.panel,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: AppTheme.gold, width: 2),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          node.title,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 12),
                        _buildHealthRow(),
                        const SizedBox(height: 20),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              node.description,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ),
                        if (_controller.lastResult != null) ...[
                          const SizedBox(height: 16),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: AppTheme.red,
                                width: 1.5,
                              ),
                            ),
                            child: Text(
                              _controller.lastResult!,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );

                final actionSection = Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          if (!isEnding) ...[
                            for (final choice in node.choices) ...[
                              _choiceButton(choice),
                              const SizedBox(height: 14),
                            ],
                          ] else ...[
                            _endButton(
                              text: 'Play Again',
                              onPressed: _controller.restartGame,
                              filled: true,
                            ),
                            const SizedBox(height: 14),
                            _endButton(
                              text: 'Back to Title',
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                          const SizedBox(height: 20),
                          _buildDecisionLog(),
                        ],
                      ),
                    ),
                  ),
                );

                return isWide
                    ? Row(
                        children: [
                          storySection,
                          actionSection,
                        ],
                      )
                    : Column(
                        children: [
                          storySection,
                          actionSection,
                        ],
                      );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildHealthRow() {
    return Row(
      children: List.generate(GameController.maxHealth, (index) {
        final filled = index < _controller.health;
        return Padding(
          padding: const EdgeInsets.only(right: 6),
          child: Icon(
            filled ? Icons.favorite : Icons.favorite_border,
            color: filled ? Colors.red : Colors.white,
            size: 30,
          ),
        );
      }),
    );
  }

  Widget _choiceButton(StoryChoice choice) {
    return SizedBox(
      width: double.infinity,
      height: 64,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppTheme.gold, width: 2),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        onPressed: () {
          _controller.makeChoice(choice);
        },
        child: Text(
          choice.text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }

  Widget _endButton({
    required String text,
    required VoidCallback onPressed,
    bool filled = false,
  }) {
    if (filled) {
      return SizedBox(
        width: double.infinity,
        height: 58,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.green,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Colors.black,
                ),
          ),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: 58,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppTheme.gold, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }

  Widget _buildDecisionLog() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.panel,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade700),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Decision Log',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppTheme.gold,
                ),
          ),
          const SizedBox(height: 10),
          if (_controller.decisionLog.isEmpty)
            Text(
              'No choices made yet.',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          else
            for (final choice in _controller.decisionLog)
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  '• $choice',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
        ],
      ),
    );
  }
}