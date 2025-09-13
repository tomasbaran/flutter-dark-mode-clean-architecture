import 'package:persistent_storage_key_value/core/storage/key_value_store.dart';
import 'package:persistent_storage_key_value/core/utils/result.dart';
import 'package:persistent_storage_key_value/features/theme/domain/entities/theme_entity.dart';
import 'package:persistent_storage_key_value/features/theme/domain/repos/theme_repo.dart';

class ThemeRepoImpl extends ThemeRepo {
  final KeyValueStore _keyValueStore;

  ThemeRepoImpl({required KeyValueStore keyValueStore})
    : _keyValueStore = keyValueStore;

  @override
  Future<Result<AppThemeMode>> getThemeMode() async {
    try {
      final storedThemeMode = await _keyValueStore.readString('theme_mode');
      final themeMode = AppThemeMode.values.firstWhere(
        (e) => e.name == storedThemeMode,
        orElse: () => AppThemeMode.light,
      );
      return Result.ok(themeMode);
    } catch (e) {
      return Result.error('Error reading theme mode from key value store');
    }
  }

  @override
  Future<Result<void>> setThemeMode(AppThemeMode themeMode) async {
    try {
      await _keyValueStore.writeString('theme_mode', themeMode.name);
      return Result.ok(null);
    } catch (e) {
      return Result.error('Error writing theme mode to key value store');
    }
  }
}
