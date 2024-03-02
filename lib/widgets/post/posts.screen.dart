import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kind_words/widgets/post/post.controller.dart';
import 'package:kind_words/widgets/post/widgets/post-card.widget.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = Get.find<PostController>().posts;

    return LayoutBuilder(builder: (context, constraints) {
      return DraggableHome(
        title: Text('Be kind'),
        headerWidget: Container(
          decoration: BoxDecoration(
            color: Colors.purple,
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            child: Column(
              children: [
                const Row(
                  children: [
                    Text(
                      'Bienvenido, Usuario',
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Progreso de amabilidad',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.75),
                        ),
                      ),
                      const SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: 0.2,
                        minHeight: 30,
                        color: Colors.purple.shade800,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tarea del dia: Responder 10 peticiones.',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 18,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        headerExpandedHeight: 0.35,
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
