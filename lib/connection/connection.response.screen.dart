import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kind_words/core/theme/theme.controller.dart';

class ConnectionResponseScreen extends StatefulWidget {
  const ConnectionResponseScreen({super.key, required this.index});

  final int index;

  @override
  State<ConnectionResponseScreen> createState() =>
      _ConnectionResponseScreenState();
}

class _ConnectionResponseScreenState extends State<ConnectionResponseScreen> {
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Petition #${widget.index}'),
      ),
      body: Stack(
        children: [
          Card(
            elevation: 0,
            color: themeController.primaryColor.value,
            child: Center(
              child: Text(
                'Petition #${widget.index}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: SizedBox(
                height: 56,
                child: Card(
                  elevation: 0,
                  color: Colors.white.withOpacity(0.3),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () => showModalBottomSheet(
                      context: context,
                      builder: (builder) => ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Scaffold(
                          appBar: AppBar(),
                          body: ListView(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            children: [
                              Form(
                                child: TextFormField(
                                  validator: (value) {
                                    return null;
                                  },
                                  maxLines: null,
                                  decoration: InputDecoration(
                                    hintText: 'Reply the petition...',
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          floatingActionButton: FloatingActionButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Icon(Icons.send),
                          ),
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Send message',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
