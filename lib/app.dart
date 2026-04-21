import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';

class DecisionDungeonApp extends StatelessWidget {
  const DecisionDungeonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Decision Dungeon',
      theme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}