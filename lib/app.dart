import 'package:flutter/material.dart';
import 'controllers/app_settings.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

class DecisionDungeonApp extends StatefulWidget {
  const DecisionDungeonApp({super.key});

  @override
  State<DecisionDungeonApp> createState() => _DecisionDungeonAppState();
}

class _DecisionDungeonAppState extends State<DecisionDungeonApp> {
  final AppSettings _settings = AppSettings();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _settings,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Decision Dungeon',
          theme: _settings.isDarkMode
              ? AppTheme.darkTheme
              : AppTheme.lightTheme,
          home: HomeScreen(settings: _settings),
        );
      },
    );
  }
}