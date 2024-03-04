import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kind_words/chat/chat.screen.dart';
import 'package:kind_words/core/theme/theme.controller.dart';
import 'package:kind_words/post/posts.screen.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:kind_words/connection/connection.screen.dart';
import 'package:kind_words/post/widgets/post.create.widget.dart';
import 'package:kind_words/settings/settings.screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const PostsScreen(),
    const ConnectionScreen(),
    const ChatsScreen(),
    const SettingsScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(
      () => Scaffold(
        body: _children[_currentIndex],
        floatingActionButton: (_currentIndex == 0 || _currentIndex == 1)
            ? FloatingActionButton(
                backgroundColor: themeController.primaryColor.value.shade200,
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
            Icons.contact_support_outlined,
            Icons.message_rounded,
            Icons.person_rounded,
          ],
          activeIndex: _currentIndex,
          gapLocation: GapLocation.end,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: onTabTapped,
          backgroundColor: themeController.isDarkTheme.value == true
              ? Colors.black
              : Colors.white,
          activeColor: themeController.primaryColor.value,
          inactiveColor: Colors.grey,
          splashColor: themeController.primaryColor.value,
        ),
      ),
    );
  }
}
