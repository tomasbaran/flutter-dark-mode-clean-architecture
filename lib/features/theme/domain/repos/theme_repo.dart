import 'package:persistent_storage_key_value/features/theme/domain/entities/theme_entity.dart';

abstract class ThemeRepo {
  Future<void> setThemeDarkMode(ThemeDarkMode themeDarkMode);
  Future<ThemeDarkMode> getThemeDarkMode();
}
