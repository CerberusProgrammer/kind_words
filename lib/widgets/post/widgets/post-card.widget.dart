import 'package:flutter/material.dart';
import 'package:kind_words/widgets/post/post.model.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: post.color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Icon(
                    post.icon,
                    size: 148,
                    color: Colors.black.withOpacity(0.15),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
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
              ],
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
