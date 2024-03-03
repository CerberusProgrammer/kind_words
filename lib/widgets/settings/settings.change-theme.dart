import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kind_words/core/global/colors.dart';
import 'package:kind_words/core/theme/theme.controller.dart';

class ChangeThemeWidget extends StatelessWidget {
  ChangeThemeWidget({
    super.key,
  });

  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PopupMenuButton<Color>(
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
        child: const Text('Change color theme'),
      ),
    );
  }
}
