import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kind_words/core/theme/theme.controller.dart';

class ConnectionViewScreen extends StatelessWidget {
  ConnectionViewScreen({
    super.key,
    required this.index,
  });

  final int index;
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Petition #$index'),
      ),
      body: Card(
        elevation: 0,
        color: themeController.primaryColor.value,
        child: Center(
          child: Text(
            'Petition #$index',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 48,
            ),
          ),
        ),
      ),
    );
  }
}
