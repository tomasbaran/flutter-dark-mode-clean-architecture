import 'package:flutter/material.dart';
import 'package:persistent_storage_key_value/core/app_dependencies.dart';
import 'package:persistent_storage_key_value/features/theme/presentation/widgets/theme_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppDependencies.buildThemeScreen(child: const ThemeScreen()),
    );
  }
}
