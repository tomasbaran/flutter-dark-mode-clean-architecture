import 'package:flutter/material.dart';
import 'package:persistent_storage_key_value/core/app_config.dart';
import 'package:persistent_storage_key_value/core/utils/command.dart';
import 'package:persistent_storage_key_value/features/theme/domain/entities/theme_entity.dart';
import 'package:persistent_storage_key_value/features/theme/domain/repos/theme_repo.dart';

class ThemeVM extends ChangeNotifier {
  final ThemeRepo _themeRepo;
  ThemeVM({required ThemeRepo themeRepo}) : _themeRepo = themeRepo;

  AppThemeMode _themeMode = AppConfig.defaultThemeMode;
  AppThemeMode? _previousThemeMode;
  AppThemeMode get themeMode => _themeMode;

  Command<AppThemeMode, Object?> get loadThemeCommand => _loadThemeCommand;
  late final _loadThemeCommand = Command(
    execute: (_) => _themeRepo.getThemeMode(),
  );

  Future init() async {
    await _loadThemeCommand.execute(null);
    final state = _loadThemeCommand.state.value;
    switch (state) {
      case Succeeded(value: final themeModeFromRepo):
        print('Command succeeded: $themeModeFromRepo');
        _themeMode = themeModeFromRepo;
        _previousThemeMode = themeModeFromRepo;
        notifyListeners();
      case Failed(message: final error):
        print('Command failed: $error');
      // There is no logic to handle this case,
      // the only thing we do about it is to print the error in the UI (theme screen) by using AppLoadingWrapper
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

    // If the command fails, we revert the theme mode to the previous one
    if (_setThemeCommand.state.value is Failed) {
      _themeMode = _previousThemeMode!;
      notifyListeners();
    } else {
      _previousThemeMode = themeMode;
    }
  }
}
