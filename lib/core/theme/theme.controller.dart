import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var isDarkTheme = false.obs;
  var primaryColor = Colors.purple.obs;

  ThemeData get themeData => ThemeData(
        brightness: isDarkTheme.value ? Brightness.dark : Brightness.light,
        colorSchemeSeed: primaryColor.value,
      );

  void changeTheme() {
    isDarkTheme.value = !isDarkTheme.value;
  }

  void changePrimaryColor(Color color) {
    primaryColor.value = color as MaterialColor;
  }
}
