import 'package:persistent_storage_key_value/core/app_config.dart';
import 'package:persistent_storage_key_value/features/theme/domain/entities/theme_entity.dart';
import 'package:persistent_storage_key_value/features/theme/domain/repos/theme_repo.dart';

class ThemeRepoFakeImpl extends ThemeRepo {
  ThemeDarkMode _currentThemeMode = AppConfig.defaultThemeMode;

  @override
  Future<void> setThemeDarkMode(ThemeDarkMode themeMode) async =>
      _currentThemeMode = themeMode;

  @override
  Future<ThemeDarkMode> getThemeDarkMode() async => _currentThemeMode;
}
