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
    // fake implementation
    return Result.success(AppThemeMode.light);
    return Result.error('error getting theme mode');
    // TODO: implement
    // return _keyValueStore.readString('theme_mode');
  }

  @override
  Future<Result<void>> setThemeMode(AppThemeMode themeMode) async {
    // fake implementation
    return Result.success(null);
    return Result.error('Error setting theme mode');
    // TODO: implement

    // return _keyValueStore.writeString('theme_mode', themeMode.name);
  }
}
