import 'package:flutter/material.dart';
import 'package:kind_words/models/post.dart';

class PostProvider extends ChangeNotifier {
  List<Post> posts = [
    Post(content: 'Hola mundo :)'),
  ];

  void addPost(Post post) {
    posts.add(post);
    notifyListeners();
  }
}
