import 'package:flutter_test/flutter_test.dart';
import 'package:persistent_storage_key_value/core/app_config.dart';
import 'package:persistent_storage_key_value/features/theme/data/repos/theme_repo_fake_impl.dart';
import 'package:persistent_storage_key_value/features/theme/domain/entities/theme_entity.dart';

void main() {
  group('ThemeRepoFakeImpl', () {
    late ThemeRepoFakeImpl themeRepo;

    setUp(() {
      themeRepo = ThemeRepoFakeImpl();
    });

    test('should return the default theme mode by default', () async {
      final result = await themeRepo.getThemeDarkMode();
      expect(result, AppConfig.defaultThemeMode);
    });

    test('should return correct mode after setting it', () async {
      for (final mode in ThemeDarkMode.values) {
        await themeRepo.setThemeDarkMode(mode);
        final result = await themeRepo.getThemeDarkMode();
        expect(result, mode);
      }
    });
  });
}
