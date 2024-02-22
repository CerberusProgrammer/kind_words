import 'package:flutter/material.dart';

class PostCreateScreen extends StatefulWidget {
  const PostCreateScreen({super.key});

  @override
  State<PostCreateScreen> createState() => _PostCreateScreenState();
}

class _PostCreateScreenState extends State<PostCreateScreen> {
  int _selectedColor = 1;
  final List<Color> colorList = [
    Colors.pink,
    Colors.purple,
    Colors.indigo,
    Colors.orange,
    Colors.red,
    Colors.green,
  ];

  double sizeText = 44;

  bool actionTextSizer = false;
  bool actionColorChanger = false;
  bool isAction = false;

  final FocusNode focusNode = FocusNode();
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetColorsSelector =
        List.generate(colorList.length, (index) {
      return IconButton(
          onPressed: () {
            setState(() {
              _selectedColor = index;
            });
          },
          icon: Icon(
            Icons.circle,
            color: colorList[index],
          ));
    });

    widgetColorsSelector.add(
      IconButton(
        onPressed: () {
          setState(() {
            actionColorChanger = false;
            isAction = false;
          });
        },
        icon: const Icon(
          Icons.done_rounded,
          color: Colors.white,
          size: 30,
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear post'),
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: MediaQuery.of(context).size.height / 1.04,
          color: Theme.of(context).colorScheme.background,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 0,
              color: colorList[_selectedColor],
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
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'Be kind',
                                hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.55),
                                  fontSize: sizeText,
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
                                    if (actionColorChanger)
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.3,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: widgetColorsSelector,
                                          ),
                                        ),
                                      ),
                                    if (actionTextSizer)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                            child: Slider(
                                              activeColor:
                                                  colorList[_selectedColor],
                                              value: sizeText,
                                              min: 20,
                                              max: 72,
                                              onChanged: (value) {
                                                setState(() {
                                                  sizeText = value;
                                                });
                                              },
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                actionTextSizer = false;
                                                isAction = false;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.done,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                        ],
                                      )
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
      ),
    );
  }
}
