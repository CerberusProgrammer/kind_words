import 'package:flutter/material.dart';

class Post {
  final String title;
  final String content;
  final IconData? icon;
  final Color? color;
  final String? author;

  Post({
    required this.title,
    required this.content,
    this.icon,
    this.color = Colors.red,
    this.author = "Anonymous",
  });
}
