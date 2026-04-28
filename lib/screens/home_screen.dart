import 'package:flutter/material.dart';
import '../controllers/app_settings.dart';
import '../services/audio_service.dart';
import '../theme/app_theme.dart';
import '../widgets/scene_art.dart';
import '../widgets/settings_sheet.dart';
import 'game_screen.dart';

class HomeScreen extends StatefulWidget {
  final AppSettings settings;

  const HomeScreen({
    super.key,
    required this.settings,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    AudioService.instance.startBackgroundMusic();
  }

  @override
  Widget build(BuildContext context) {
    final settings = widget.settings;
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: settings,
      builder: (context, _) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: settings.isDarkMode
                  ? const LinearGradient(
                      colors: [
                        Color(0xFF1E1E1E),
                        Color(0xFF111111),
                        Color(0xFF090909),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )
                  : const LinearGradient(
                      colors: [
                        Color(0xFFF2E4C4),
                        Color(0xFFE4D3AE),
                        Color(0xFFD6C097),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
            ),
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 620),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surface.withOpacity(0.92),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: AppTheme.gold, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Decision\nDungeon',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.displayLarge,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Choose wisely. Survive the dungeon.',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  color: AppTheme.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 22),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surface.withOpacity(0.92),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: AppTheme.gold, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Enter the Dungeon',
                                style: theme.textTheme.headlineMedium,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _smallIcon('assets/images/scene/altar/key_1.png'),
                                  const SizedBox(width: 16),
                                  _smallIcon('assets/images/scene/chest/chest_1.png'),
                                  const SizedBox(width: 16),
                                  _smallIcon('assets/images/scene/cursed/skull_1.png'),
                                ],
                              ),
                              const SizedBox(height: 18),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(
                                    settings.isDarkMode ? 0.28 : 0.08,
                                  ),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: const SceneArt(
                                  frames: [
                                    'assets/images/scene/door/door_1.png',
                                    'assets/images/scene/door/door_2.png',
                                    'assets/images/scene/door/door_3.png',
                                    'assets/images/scene/door/door_4.png',
                                    'assets/images/scene/door/door_5.png',
                                  ],
                                  height: 120,
                                ),
                              ),
                              const SizedBox(height: 18),
                              Text(
                                'A branching fantasy adventure where every choice changes your fate.',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                height: 58,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppTheme.green,
                                    foregroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => GameScreen(settings: settings),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Start Game',
                                    style: theme.textTheme.labelLarge?.copyWith(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              SizedBox(
                                width: double.infinity,
                                height: 54,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                      color: AppTheme.gold,
                                      width: 2,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  onPressed: () => showSettingsSheet(context, settings),
                                  child: Text(
                                    'Settings',
                                    style: theme.textTheme.labelLarge,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Version 1.3.2',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _smallIcon(String path) {
    return Container(
      width: 42,
      height: 42,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.12),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppTheme.gold.withOpacity(0.45),
          width: 1.2,
        ),
      ),
      child: Image.asset(
        path,
        filterQuality: FilterQuality.none,
      ),
    );
  }
}