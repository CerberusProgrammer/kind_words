import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kind_words/core/theme/theme.controller.dart';

class ChatViewScreen extends StatelessWidget {
  const ChatViewScreen({
    super.key,
    required this.user,
    required this.post,
    required this.message,
  });

  final int user;
  final int post;
  final String message;

  @override
  Widget build(BuildContext context) {
    var themeController = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Message from $user'),
      ),
      body: Card(
        color: themeController.primaryColor.value,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  message,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
