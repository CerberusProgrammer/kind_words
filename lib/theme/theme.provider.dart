import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;

  ThemeData get appTheme => ThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        useMaterial3: true,
        colorSchemeSeed: Colors.purple,
      );

  void toggleBrightness() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
