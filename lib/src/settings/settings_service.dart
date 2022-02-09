import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
abstract class SettingsService {
  Future<ThemeMode> themeMode();
  Future<void> updateThemeMode(ThemeMode theme);
}

class SharedPrefSettingsService extends SettingsService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final String _modeKey = "theme_mode";

  @override
  Future<ThemeMode> themeMode() async {
    // get shared prefs for the theme mode
    String? theme = (await _prefs).getString(_modeKey);

    return ThemeMode.values.byName(theme ?? ThemeMode.system.name);
  }

  @override
  Future<void> updateThemeMode(ThemeMode theme) async {
    // Use shared_preferences package
    _prefs.then(
        (prefs) => prefs.setString(_modeKey, theme.toString().split('.')[1]));
  }
}
