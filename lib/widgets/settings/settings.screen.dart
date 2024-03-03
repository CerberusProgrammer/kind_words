import 'package:flutter/material.dart';
import 'package:kind_words/widgets/settings/settings.change-brightness.dart';
import 'package:kind_words/widgets/settings/settings.change-theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ChangeBrightness(),
          ChangeThemeWidget(),
        ],
      ),
    );
  }
}
