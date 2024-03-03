import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kind_words/core/theme/theme.controller.dart';

class ChangeBrightness extends StatelessWidget {
  ChangeBrightness({
    super.key,
  });

  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SwitchListTile(
        title: const Text('Dark mode'),
        subtitle: const Text('Enable dark mode'),
        value: themeController.isDarkTheme.value,
        onChanged: (value) {
          themeController.changeTheme();
        },
      ),
    );
  }
}
