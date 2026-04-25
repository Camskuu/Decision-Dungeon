import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class BlinkingPrompt extends StatefulWidget {
  final String text;

  const BlinkingPrompt({
    super.key,
    required this.text,
  });

  @override
  State<BlinkingPrompt> createState() => _BlinkingPromptState();
}

class _BlinkingPromptState extends State<BlinkingPrompt>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..repeat(reverse: true);

    _opacity = Tween<double>(
      begin: 0.25,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: Text(
        widget.text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppTheme.gold,
            ),
      ),
    );
  }
}