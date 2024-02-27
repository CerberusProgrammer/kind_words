import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kind_words/widgets/post/post.controller.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:kind_words/widgets/post/widgets/post-card.widget.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = Get.find<PostController>().posts;

    return LayoutBuilder(builder: ((context, constraints) {
      return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, constraints.maxHeight / 3),
            child: Container(
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
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ]),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Bienvenido, Omar.'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Column(children: [
                SizedBox(
                  width: double.infinity,
                  height: constraints.maxHeight / 2.5,
                  child: Expanded(
                      child: Obx(() => AppinioSwiper(
                            cardBuilder: (BuildContext context, int index) {
                              return PostCard(
                                post: posts[index],
                              );
                            },
                            cardCount: posts.length,
                          ))),
                )
              ])));
    }));
  }
}
