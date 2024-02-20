import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: GridView.count(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
        children: List.generate(
          20,
          (index) => Card(
            color: (index % 2 == 0) ? Colors.purple : Colors.red,
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.handshake_rounded,
                            size: 148,
                            color: Colors.black.withOpacity(0.15),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Text(
                              'Welcome to my Application',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white.withOpacity(0.8),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0, bottom: 8),
                        child: Text(
                          'By John Doe',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white.withOpacity(0.5),
                              fontWeight: FontWeight.w400),
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
    );
  }
}
