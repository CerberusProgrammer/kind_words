import 'package:flutter/material.dart';

class Post {
  final String content;
  final double textSize;
  final IconData icon;
  final Color color;
  final String author;

  Post({
    required this.content,
    this.textSize = 24,
    this.icon = Icons.handshake,
    this.color = Colors.red,
    this.author = "Anonymous",
  });
}
