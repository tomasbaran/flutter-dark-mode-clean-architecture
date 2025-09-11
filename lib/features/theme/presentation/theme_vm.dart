import 'package:flutter/material.dart';
import 'package:persistent_storage_key_value/core/app_config.dart';
import 'package:persistent_storage_key_value/core/utils/command.dart';
import 'package:persistent_storage_key_value/features/theme/domain/entities/theme_entity.dart';
import 'package:persistent_storage_key_value/features/theme/domain/repos/theme_repo.dart';

class ThemeVM extends ChangeNotifier {
  final ThemeRepo _themeRepo;
  ThemeVM({required ThemeRepo themeRepo}) : _themeRepo = themeRepo;

  AppThemeMode _themeMode = AppConfig.defaultThemeMode;
  AppThemeMode get themeMode => _themeMode;

  Command<AppThemeMode, Object?> get loadThemeCommand => _loadThemeCommand;
  late final _loadThemeCommand = Command(
    execute: (_) => _themeRepo.getThemeMode(),
  );

  Future init() async {
    await _loadThemeCommand.execute(null);
    final state = _loadThemeCommand.state;
    switch (state) {
      case Succeeded(value: final themeMode):
        _themeMode = themeMode;
        notifyListeners();
        print('Command succeeded: $themeMode');
      case Failed(message: final error):
        print('Command failed: $error');
      case Executing():
        print('Command executing');
      case Idle():
        print('Command idle');
    }
  }

  Command<void, AppThemeMode> get setThemeCommand => _setThemeCommand;

  late final Command<void, AppThemeMode> _setThemeCommand = Command(
    execute: (themeMode) async => await _themeRepo.setThemeMode(themeMode),
  );

  setTheme(AppThemeMode themeMode) async {
    _themeMode = themeMode;
    notifyListeners();
    await _setThemeCommand.execute(themeMode);
  }
}
