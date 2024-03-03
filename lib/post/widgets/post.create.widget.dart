import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kind_words/core/theme/theme.controller.dart';
import 'package:kind_words/post/post.controller.dart';
import 'package:kind_words/post/post.model.dart';

class PostCreateScreen extends StatelessWidget {
  final _postController = TextEditingController();

  PostCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Crear post'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() => Card(
                elevation: 0,
                color: themeController.primaryColor.value,
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Form(
                              child: TextFormField(
                                controller: _postController,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.text,
                                maxLines: null,
                                cursorColor: Colors.white.withOpacity(0.7),
                                cursorWidth: 4,
                                cursorRadius: const Radius.circular(20),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Be kind',
                                  hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.55),
                                  ),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                color: Colors.white.withAlpha(1),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Get.find<PostController>().addPost(
                                            Post(
                                              content: _postController.text,
                                              author: "Anonymous",
                                            ),
                                          );
                                          Get.back();
                                        },
                                        icon: const Icon(
                                          Icons.upload,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
