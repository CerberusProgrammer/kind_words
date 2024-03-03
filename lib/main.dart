import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kind_words/dashboard.screen.dart';
import 'package:kind_words/core/config/theme/theme.controller.dart';
import 'package:kind_words/widgets/post/post.controller.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeController.themeData,
        home: const DashboardScreen(),
        initialBinding: BindingsBuilder(() {
          Get.put(PostController());
        }),
      );
    });
  }
}
