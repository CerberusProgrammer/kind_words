import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  ThemeData get appTheme => ThemeData(
        brightness: isDarkMode.value ? Brightness.dark : Brightness.light,
        useMaterial3: true,
        colorSchemeSeed: Colors.purple,
      );

  void toggleBrightness() {
    isDarkMode.value = !isDarkMode.value;
    update();
  }
}
