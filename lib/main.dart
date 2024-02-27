import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kind_words/dashboard.screen.dart';
import 'package:kind_words/core/config/theme/theme.controller.dart';
import 'package:kind_words/widgets/post/post.controller.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(ThemeController());
        Get.put(PostController());
      }),
      debugShowCheckedModeBanner: false,
      home: const DashboardScreen(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeController.appTheme,
      home: const DashboardScreen(),
    );
  }
}
