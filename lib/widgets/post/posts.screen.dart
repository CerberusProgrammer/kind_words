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

    return LayoutBuilder(
      builder: (context, constraints) {
        return DraggableHome(
          headerExpandedHeight: 0.35,
          title: const Text('Be kind'),
          headerWidget: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            color: Colors.purple,
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
                        value: 0.5,
                        minHeight: 20,
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.purple.shade800,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
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
          body: [
            const SizedBox(height: 48),
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 8,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: constraints.maxHeight / 1.5,
                    child: Obx(
                      () => AppinioSwiper(
                        cardBuilder: (context, index) => PostCard(
                          post: posts[index],
                        ),
                        cardCount: posts.length,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
