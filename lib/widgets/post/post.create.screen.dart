import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kind_words/widgets/post/post.controller.dart';
import 'package:kind_words/widgets/post/post.dart';

class PostCreateScreen extends StatelessWidget {
  final _selectedColor = 1.obs;
  final _colorList = [
    Colors.pink,
    Colors.purple,
    Colors.indigo,
    Colors.orange,
    Colors.red,
    Colors.green,
  ];
  final _sizeText = 44.0.obs;
  final _actionTextSizer = false.obs;
  final _actionColorChanger = false.obs;
  final _isAction = false.obs;
  final _postController = TextEditingController();

  PostCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                color: _colorList[_selectedColor.value],
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
                                style: TextStyle(
                                  fontSize: _sizeText.value,
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Be kind',
                                  hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.55),
                                    fontSize: _sizeText.value,
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
                                      if (_actionColorChanger.value)
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.3,
                                          height: 46,
                                          child: Center(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: List.generate(
                                                    _colorList.length, (index) {
                                                  return IconButton(
                                                    onPressed: () {
                                                      _selectedColor.value =
                                                          index;
                                                    },
                                                    icon: Icon(Icons.circle,
                                                        color:
                                                            _colorList[index]),
                                                  );
                                                }),
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (_actionTextSizer.value)
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 10,
                                              child: Slider(
                                                activeColor: _colorList[
                                                    _selectedColor.value],
                                                value: _sizeText.value,
                                                min: 20,
                                                max: 72,
                                                onChanged: (value) {
                                                  _sizeText.value = value;
                                                },
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                _actionTextSizer.value = false;
                                                _isAction.value = false;
                                              },
                                              icon: const Icon(
                                                Icons.done,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (!_isAction.value)
                                        IconButton(
                                          onPressed: () {
                                            _actionColorChanger.value = true;
                                            _isAction.value = true;
                                          },
                                          icon: const Icon(
                                            Icons.palette,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                      if (!_isAction.value)
                                        IconButton(
                                          onPressed: () {
                                            _actionTextSizer.value = true;
                                            _isAction.value = true;
                                          },
                                          icon: const Icon(Icons.format_size),
                                          color: Colors.white,
                                          iconSize: 30,
                                        ),
                                      if (!_isAction.value)
                                        SizedBox(
                                          height: 20,
                                          child: VerticalDivider(
                                            thickness: 3,
                                            color:
                                                Colors.white.withOpacity(0.5),
                                          ),
                                        ),
                                      if (!_isAction.value)
                                        IconButton(
                                          onPressed: () {
                                            Get.find<PostController>().addPost(
                                              Post(
                                                content: _postController.text,
                                                color: _colorList[
                                                    _selectedColor.value],
                                                textSize: _sizeText.value,
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
