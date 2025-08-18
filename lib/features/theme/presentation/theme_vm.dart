import 'package:flutter/material.dart';
import 'package:persistent_storage_key_value/core/app_config.dart';
import 'package:persistent_storage_key_value/core/utils/command.dart';
import 'package:persistent_storage_key_value/features/theme/domain/entities/theme_entity.dart';
import 'package:persistent_storage_key_value/features/theme/domain/repos/theme_repo.dart';

class ThemeVM extends ChangeNotifier {
  final ThemeRepo _themeRepo;

  ThemeVM({required ThemeRepo themeRepo}) : _themeRepo = themeRepo;

  get loadResourcesCommand => _loadResourcesCommand;

  late final _loadResourcesCommand = Command(
    execute: () async => await _themeRepo.getThemeMode(),
  );

  Future init() async {
    await _loadResourcesCommand.execute();
    final state = _loadResourcesCommand.state;
    switch (state) {
      case Succeeded(value: final themeMode):
        print(themeMode);
      case Failed(message: final error):
        print(error);
      case Executing():
        print('loading');
      case Idle():
        print('idle');
    }
  }

  AppThemeMode _themeMode = AppConfig.defaultThemeMode;

  Command<void> get setThemeCommand => _setThemeCommand;

  late final Command<void> _setThemeCommand = Command(
    execute: () async => await _themeRepo.setThemeMode(_themeMode),
  );

  setTheme(AppThemeMode themeMode) async {
    _themeMode = themeMode;
    await _setThemeCommand.execute();
  }
}
