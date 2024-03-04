import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kind_words/chat/chat.view.screen.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Messages'),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          itemBuilder: (context, index) => ListTile(
            leading: CircleAvatar(
              child: Text('$index'),
            ),
            title: Text('User $index'),
            subtitle: Text('Message from user to the post $index.'),
            onTap: () => Get.to(
              () => ChatViewScreen(
                user: index,
                post: index,
                message: 'message $index',
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
