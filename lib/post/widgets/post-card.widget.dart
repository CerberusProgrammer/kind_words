import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kind_words/core/theme/theme.controller.dart';
import 'package:kind_words/post/post.model.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Card(
      elevation: 10,
      color: themeController.primaryColor.value,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Center(
                child: Text(
                  post.content,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.white.withOpacity(0.5),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0, bottom: 8),
                child: Text(
                  'By ${post.author}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.5),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
