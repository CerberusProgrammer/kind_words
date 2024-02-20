import 'package:flutter/material.dart';
import 'package:kind_words/screen/home/home.screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = const [
    HomeScreen(),
    Text('Ventana 2'),
    Text('Ventana 3'),
    Text('Ventana 4'),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home_rounded),
            title: const Text("Home"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.message_rounded),
            title: const Text("Messages"),
            selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.contact_support_outlined),
            title: const Text("Request"),
            selectedColor: Colors.orange,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.person_rounded),
            title: const Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
