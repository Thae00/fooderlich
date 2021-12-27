import 'package:flutter/material.dart';
import 'package:fooderlich/screen/home.dart';
import 'package:fooderlich/theme/fooderlich_theme.dart';

void main() {
  runApp(Fooderlich());
}

class Fooderlich extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Create Theme
    final theme = FooderlichTheme.dark();
    // Apply Home Widget
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Add theme
      theme: theme,
      title: 'Fooderlich',
      home: Home(),
    );
  }
}
