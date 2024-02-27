import 'package:flutter/material.dart';
import 'package:kind_words/widgets/post/post.dart';

class PostViewScreen extends StatefulWidget {
  const PostViewScreen({super.key, required this.post});

  final Post post;

  @override
  State<PostViewScreen> createState() => _PostViewScreenState();
}

class _PostViewScreenState extends State<PostViewScreen> {
  @override
  Widget build(BuildContext context) {
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
            color: widget.post.color,
            child: Stack(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      widget.post.content,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: widget.post.textSize,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Icon(
                    widget.post.icon,
                    size: 256,
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
