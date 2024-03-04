import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kind_words/core/theme/theme.controller.dart';
import 'package:kind_words/post/post.controller.dart';
import 'package:kind_words/post/widgets/post-card.widget.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = Get.find<PostController>().posts;
    final themeController = Get.find<ThemeController>();

    return LayoutBuilder(builder: (context, constraints) {
      return DraggableHome(
        title: const Text('Be kind'),
        headerWidget: Container(
          decoration: BoxDecoration(
            color: themeController.primaryColor.value,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 5,
                blurRadius: 5,
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 32,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Welcome, Usuario',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        headerExpandedHeight: 0.15,
        body: [
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: constraints.maxHeight / 2.5,
                  child: Obx(
                    () => AppinioSwiper(
                      cardBuilder: (context, index) => PostCard(
                        post: posts[index],
                      ),
                      cardCount: posts.length,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );
    });
  }
}
