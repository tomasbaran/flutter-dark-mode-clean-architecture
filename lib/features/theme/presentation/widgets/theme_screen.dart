import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_storage_key_value/features/theme/domain/entities/theme_entity.dart';
import 'package:persistent_storage_key_value/features/theme/presentation/theme_vm.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeVM = context.read<ThemeVM>();
    return Scaffold(
      backgroundColor: themeVM.themeMode == AppThemeMode.light
          ? Colors.white
          : Colors.black,
      appBar: AppBar(
        title: Text('Theme Screen'),
        actions: [CupertinoSwitch(value: true, onChanged: (value) {})],
      ),
      body: Center(child: Text(themeVM.themeMode.name)),
    );
  }
}
