import 'package:assistant/src/settings/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('SharedPrefSettingsService', () {
    test('should persist theme mode value', () async {
      SharedPreferences.setMockInitialValues({"theme_mode": "dark"});

      SettingsService settings = SharedPrefSettingsService();
      ThemeMode mode = await settings.themeMode();
      expect(mode, ThemeMode.dark);

      await settings.updateThemeMode(ThemeMode.light);
      mode = await settings.themeMode();
      expect(mode, ThemeMode.light);

      await settings.updateThemeMode(ThemeMode.system);
      mode = await settings.themeMode();
      expect(mode, ThemeMode.system);
    });
  });
}
