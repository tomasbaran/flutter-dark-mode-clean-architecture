import 'package:persistent_storage_key_value/core/utils/result.dart';
import 'package:persistent_storage_key_value/features/theme/domain/entities/theme_entity.dart';

abstract class ThemeRepo {
  Future<Result<void>> setThemeMode(AppThemeMode themeMode);
  Future<Result<AppThemeMode>> getThemeMode();
}
