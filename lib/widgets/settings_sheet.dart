import 'package:flutter/material.dart';
import '../controllers/app_settings.dart';
import '../theme/app_theme.dart';

void showSettingsSheet(BuildContext context, AppSettings settings) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    showDragHandle: false,
    builder: (_) {
      return AnimatedBuilder(
        animation: settings,
        builder: (context, __) {
          final isDark = settings.isDarkMode;

          final sheetColor =
              isDark ? AppTheme.darkPanel : AppTheme.lightPanel;
          final textColor =
              isDark ? AppTheme.textLight : AppTheme.lightText;
          final handleColor =
              isDark ? Colors.white70 : Colors.brown.shade700;

          return Container(
            decoration: BoxDecoration(
              color: sheetColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(28),
              ),
            ),
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 42,
                      height: 5,
                      decoration: BoxDecoration(
                        color: handleColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'Settings',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 16),
                    SwitchListTile(
                      activeColor: Colors.black,
                      activeTrackColor: AppTheme.gold,
                      value: settings.isDarkMode,
                      onChanged: settings.toggleTheme,
                      title: Text(
                        'Dark Theme',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: textColor),
                      ),
                    ),
                    SwitchListTile(
                      activeColor: Colors.black,
                      activeTrackColor: AppTheme.gold,
                      value: settings.soundOn,
                      onChanged: settings.toggleSound,
                      title: Text(
                        'Sound',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: textColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}