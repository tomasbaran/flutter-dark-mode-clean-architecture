import 'package:persistent_storage_key_value/core/app_config.dart';
import 'package:persistent_storage_key_value/core/utils/result.dart';
import 'package:persistent_storage_key_value/features/theme/domain/entities/theme_entity.dart';
import 'package:persistent_storage_key_value/features/theme/domain/repos/theme_repo.dart';

class ThemeRepoFakeImpl extends ThemeRepo {
  AppThemeMode _currentThemeMode = AppConfig.defaultThemeMode;

  @override
  Future<Result<void>> setThemeMode(AppThemeMode themeMode) async {
    _currentThemeMode = themeMode;
    return Result.success(null);
    return Result.error('Error setting theme mode');
  }

  @override
  Future<Result<AppThemeMode>> getThemeMode() async {
    return Result.success(_currentThemeMode);
    return Result.error('error getting theme mode');
  }
}
