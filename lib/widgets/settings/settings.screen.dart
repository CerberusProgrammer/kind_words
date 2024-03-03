import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kind_words/core/config/theme/theme.controller.dart';

final Map<Color, String> colorList = {
  Colors.blue: 'Blue',
  Colors.red: 'Red',
  Colors.green: 'Green',
  Colors.orange: 'Orange',
  Colors.purple: 'Purple',
  Colors.brown: 'Brown',
  Colors.grey: 'Grey',
  Colors.teal: 'Teal',
  Colors.cyan: 'Cyan',
  Colors.indigo: 'Indigo',
};

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: ListView(
          children: [
            SwitchListTile(
              title: const Text('Dark mode'),
              subtitle: const Text('Enable dark mode'),
              value: themeController.isDarkTheme.value,
              onChanged: (value) {
                themeController.changeTheme();
              },
            ),
            PopupMenuButton<Color>(
              onSelected: (color) {
                themeController.changePrimaryColor(color);
              },
              itemBuilder: (context) {
                return colorList.entries.map((e) {
                  return PopupMenuItem<Color>(
                    value: e.key,
                    child: ListTile(
                      title: Text(e.value),
                      leading: Icon(
                        Icons.circle,
                        color: e.key,
                      ),
                    ),
                  );
                }).toList();
              },
              child: Text('Change color theme'),
            ),
          ],
        ),
      ),
    );
  }
}
