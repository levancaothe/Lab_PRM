import 'package:flutter/material.dart';
import 'package:lab_4/input_controls_demo.dart';
import 'core_widgets_demo.dart';
import 'debug_fix_demo.dart';
import 'input_controls_demo.dart';
import 'layout_basics_demo.dart';
import 'scaffold_theme_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const CoreWidgetsDemo(),
      // home: const InputControlsDemo(),
      // home: const LayoutBasicsDemo(),
      // home: const ScaffoldThemeDemo(),
      home: DebugFixDemo(),
    );
  }
}
