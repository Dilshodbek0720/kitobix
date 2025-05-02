import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';

extension ThemeExtensions on BuildContext {
  bool isDark() {
    AdaptiveThemeMode currentMode = AdaptiveTheme.of(this).mode;
    if (currentMode == AdaptiveThemeMode.system) {
      Brightness currentBrightness = MediaQuery.of(this).platformBrightness;
      return currentBrightness == Brightness.dark;
    }

    return currentMode == AdaptiveThemeMode.dark;
  }
}
