import 'package:flutter/material.dart';
import 'package:kind_words/widgets/post/models/post.dart';
import 'package:kind_words/widgets/post/providers/post.provider.dart';
import 'package:provider/provider.dart';

class PostCreateScreen extends StatefulWidget {
  const PostCreateScreen({super.key});

  @override
  State<PostCreateScreen> createState() => _PostCreateScreenState();
}

class _PostCreateScreenState extends State<PostCreateScreen> {
  int _selectedColor = 1;

  final List<Color> _colorList = [
    Colors.pink,
    Colors.purple,
    Colors.indigo,
    Colors.orange,
    Colors.red,
    Colors.green,
  ];

  late List<Widget> _widgetColorsSelector;

  double _sizeText = 44;
  bool _actionTextSizer = false;
  bool _actionColorChanger = false;
  bool _isAction = false;

  // final FocusNode _focusNode = FocusNode();
  final TextEditingController _postController = TextEditingController();

  @override
  void initState() {
    _widgetColorsSelector = List.generate(_colorList.length, (index) {
      return IconButton(
          onPressed: () {
            setState(() {
              _selectedColor = index;
            });
          },
          icon: Icon(Icons.circle, color: _colorList[index]));
    });

    _widgetColorsSelector.add(
      IconButton(
        onPressed: () {
          setState(() {
            _actionColorChanger = false;
            _isAction = false;
          });
        },
        icon: const Icon(Icons.done_rounded, color: Colors.white, size: 30),
      ),
    );
    super.initState();
  }

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
          child: Card(
            elevation: 0,
            color: _colorList[_selectedColor],
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
                              fontSize: _sizeText,
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Be kind',
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.55),
                                fontSize: _sizeText,
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
                                  if (_actionColorChanger)
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      height: 46,
                                      child: Center(
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: _widgetColorsSelector,
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (_actionTextSizer)
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                          child: Slider(
                                            activeColor:
                                                _colorList[_selectedColor],
                                            value: _sizeText,
                                            min: 20,
                                            max: 72,
                                            onChanged: (value) {
                                              setState(() {
                                                _sizeText = value;
                                              });
                                            },
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _actionTextSizer = false;
                                              _isAction = false;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.done,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                  if (!_isAction)
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _actionColorChanger = true;
                                          _isAction = true;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.palette,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  if (!_isAction)
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _actionTextSizer = true;
                                          _isAction = true;
                                        });
                                      },
                                      icon: const Icon(Icons.format_size),
                                      color: Colors.white,
                                      iconSize: 30,
                                    ),
                                  if (!_isAction)
                                    SizedBox(
                                      height: 20,
                                      child: VerticalDivider(
                                        thickness: 3,
                                        color: Colors.white.withOpacity(0.5),
                                      ),
                                    ),
                                  if (!_isAction)
                                    IconButton(
                                      onPressed: () {
                                        context.read<PostProvider>().addPost(
                                              Post(
                                                content: _postController.text,
                                                color:
                                                    _colorList[_selectedColor],
                                                textSize: _sizeText,
                                                author: "Anonymous",
                                              ),
                                            );
                                        Navigator.pop(context);
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
          ),
        ),
      ),
    );
  }
}
