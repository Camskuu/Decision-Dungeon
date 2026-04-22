import 'package:flutter/material.dart';
import '../controllers/app_settings.dart';
import '../controllers/game_controller.dart';
import '../models/story_choice.dart';
import '../theme/app_theme.dart';
import '../widgets/scene_art.dart';
import '../widgets/settings_sheet.dart';
import '../widgets/typewriter_text.dart';

class GameScreen extends StatefulWidget {
  final AppSettings settings;

  const GameScreen({
    super.key,
    required this.settings,
  });

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
    return AnimatedBuilder(
      animation: Listenable.merge([_controller, widget.settings]),
      builder: (context, _) {
        final isDark = widget.settings.isDarkMode;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Decision Dungeon'),
            actions: [
              IconButton(
                onPressed: () => showSettingsSheet(context, widget.settings),
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: isDark
                  ? const LinearGradient(
                      colors: [
                        Color(0xFF181818),
                        Color(0xFF101010),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )
                  : const LinearGradient(
                      colors: [
                        Color(0xFFF1E2BE),
                        Color(0xFFE2D0A7),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
            ),
            child: SafeArea(
              child: _controller.showingEventScreen
                  ? _buildEventScreen(context, isDark)
                  : _buildGameplayScreen(context, isDark),
            ),
          ),
        );
      },
    );
  }

  Widget _buildGameplayScreen(BuildContext context, bool isDark) {
    final node = _controller.currentNode;
    final isEnding = node.isEnding;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 850;

        final storySection = Expanded(
          flex: 3,
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface.withOpacity(0.95),
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
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.black.withOpacity(0.25)
                        : Colors.brown.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: SceneArt(
                    frames: node.sceneFrames,
                    height: isWide ? 120 : 95,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: SingleChildScrollView(
                    child: TypewriterText(
                      key: ValueKey('desc_${node.id}'),
                      text: node.description,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
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
                      _choiceButton(choice, isDark),
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
                  const SizedBox(height: 18),
                  _buildDecisionLog(isDark),
                ],
              ),
            ),
          ),
        );

        return isWide
            ? Row(
                children: [storySection, actionSection],
              )
            : Column(
                children: [storySection, actionSection],
              );
      },
    );
  }

  Widget _buildEventScreen(BuildContext context, bool isDark) {
    final choice = _controller.pendingChoice;
    final eventText = _controller.eventText ?? '';
    final currentNode = _controller.currentNode;

    final panelColor = isDark
        ? const Color(0xFF171717)
        : const Color(0xFFE8D9B7);

    final messageBoxColor = isDark
        ? const Color(0xFF0D0D0D)
        : const Color(0xFFF7EFD9);

    final messageTextColor = isDark
        ? AppTheme.textLight
        : AppTheme.lightText;

    final subTextColor = isDark
        ? Colors.white70
        : Colors.brown.shade700;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: panelColor,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppTheme.gold, width: 3),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  'Action Result',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: AppTheme.gold,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 14),

                Text(
                  'You chose: ${choice?.text ?? ''}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: subTextColor,
                      ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 18),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.black.withOpacity(0.22)
                        : Colors.brown.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: SceneArt(
                    frames: currentNode.sceneFrames,
                    height: 130,
                  ),
                ),

                const SizedBox(height: 20),

                // Retro RPG message box
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppTheme.gold,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: panelColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        color: messageBoxColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppTheme.gold,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.play_arrow_rounded,
                                color: AppTheme.red,
                                size: 22,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'Event',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: AppTheme.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          TypewriterText(
                            key: ValueKey('event_$eventText'),
                            text: eventText,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                  color: messageTextColor,
                                  height: 1.45,
                                ),
                            speed: const Duration(milliseconds: 16),
                          ),
                          if ((choice?.healthChange ?? 0) != 0) ...[
                            const SizedBox(height: 14),
                            Text(
                              choice!.healthChange < 0
                                  ? 'Health ${choice.healthChange}'
                                  : 'Health +${choice.healthChange}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: choice.healthChange < 0
                                        ? AppTheme.red
                                        : AppTheme.green,
                                  ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 22),

                SizedBox(
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
                    onPressed: _controller.advanceFromEvent,
                    child: Text(
                      'Continue',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
            color: filled ? Colors.red : Colors.grey,
            size: 30,
          ),
        );
      }),
    );
  }

  Widget _choiceButton(StoryChoice choice, bool isDark) {
    final buttonBackground = isDark
        ? Colors.black.withOpacity(0.75)
        : const Color(0xFFF3E7C7);

    final buttonTextColor = isDark
        ? AppTheme.textLight
        : AppTheme.lightText;

    return SizedBox(
      width: double.infinity,
      height: 64,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppTheme.gold, width: 2),
          backgroundColor: buttonBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        onPressed: () => _controller.makeChoice(choice),
        child: Text(
          choice.text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: buttonTextColor,
              ),
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

  Widget _buildDecisionLog(bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.95),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isDark ? Colors.grey.shade600 : Colors.brown.shade300,
        ),
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
          const SizedBox(height: 8),
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