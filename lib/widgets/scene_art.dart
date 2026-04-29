import 'dart:async';
import 'package:flutter/material.dart';

class SceneArt extends StatefulWidget {
  final List<String> frames;
  final double height;

  const SceneArt({
    super.key,
    required this.frames,
    this.height = 170,
  });

  @override
  State<SceneArt> createState() => _SceneArtState();
}

class _SceneArtState extends State<SceneArt> {
  Timer? _timer;
  int _frameIndex = 0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  @override
  void didUpdateWidget(covariant SceneArt oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.frames != widget.frames) {
      _frameIndex = 0;
      _startAnimation();
    }
  }

  void _startAnimation() {
    _timer?.cancel();

    if (widget.frames.length <= 1) return;

    _timer = Timer.periodic(const Duration(milliseconds: 220), (_) {
      if (!mounted) return;
      setState(() {
        _frameIndex = (_frameIndex + 1) % widget.frames.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.frames.isEmpty) {
      return SizedBox(
        height: widget.height,
        width: double.infinity,
      );
    }

    return SizedBox(
      width: double.infinity,
      height: widget.height,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Image.asset(
          widget.frames[_frameIndex],
          filterQuality: FilterQuality.none,
        ),
      ),
    );
  }
}