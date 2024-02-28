import 'package:flutter/material.dart';
import 'package:kind_words/widgets/post/posts.screen.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:kind_words/widgets/petition/petitions.screen.dart';
import 'package:kind_words/widgets/post/widgets/post.create.widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = const [
    PostsScreen(),
    Text('Ventana 2'),
    PetitionsScreen(),
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
      floatingActionButton: (_currentIndex == 0 || _currentIndex == 2)
          ? FloatingActionButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) => PostCreateScreen(),
                ),
              ),
              child: const Icon(Icons.add),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        elevation: 10,
        icons: const [
          Icons.home,
          Icons.message_rounded,
          Icons.contact_support_outlined,
          Icons.person_rounded,
        ],
        activeIndex: _currentIndex,
        gapLocation: GapLocation.end,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: onTabTapped,
        activeColor: Theme.of(context).colorScheme.primary,
        inactiveColor: Colors.grey,
        splashColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
