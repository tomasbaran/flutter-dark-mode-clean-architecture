import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_storage_key_value/core/app_config.dart';
import 'package:persistent_storage_key_value/features/theme/domain/entities/theme_entity.dart';
import 'package:persistent_storage_key_value/features/theme/presentation/theme_vm.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeVM = context.read<ThemeVM>();
    final themeMode = context.select<ThemeVM, AppThemeMode>(
      (vm) => vm.themeMode,
    );
    return Scaffold(
      backgroundColor: themeMode == AppThemeMode.light
          ? Colors.white
          : Colors.black,
      appBar: AppBar(
        title: Text('Dark Mode'),
        actions: [
          CupertinoSwitch(
            value: themeMode == AppThemeMode.dark,
            onChanged: (value) {
              final setToDarkMode = value;
              themeVM.setTheme(
                setToDarkMode ? AppThemeMode.dark : AppConfig.defaultThemeMode,
              );
            },
          ),
        ],
      ),
      body: Center(child: Text(themeMode.name)),
    );
  }
}
