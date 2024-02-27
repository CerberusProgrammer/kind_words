import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;
  var color = Colors.purple.obs;

  ThemeData get appTheme => ThemeData(
        brightness: isDarkMode.value ? Brightness.dark : Brightness.light,
        useMaterial3: true,
        colorSchemeSeed: color.value,
      );

  void toggleBrightness() {
    isDarkMode.value = !isDarkMode.value;
    update();
  }
}
