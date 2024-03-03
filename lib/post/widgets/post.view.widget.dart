import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kind_words/core/theme/theme.controller.dart';
import 'package:kind_words/post/post.model.dart';

class PostViewScreen extends StatefulWidget {
  const PostViewScreen({super.key, required this.post});

  final Post post;

  @override
  State<PostViewScreen> createState() => _PostViewScreenState();
}

class _PostViewScreenState extends State<PostViewScreen> {
  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Post by ${widget.post.author}'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 0,
            color: themeController.primaryColor.value,
            child: Expanded(
              child: Center(
                child: Text(
                  widget.post.content,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
