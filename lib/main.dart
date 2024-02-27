import 'package:flutter/material.dart';
import 'package:kind_words/widgets/post/providers/post.provider.dart';
import 'package:kind_words/dashboard.screen.dart';
import 'package:kind_words/core/config/theme/theme.provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PostProvider(),
        )
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.appTheme,
      home: const DashboardScreen(),
    );
  }
}
