import 'package:flutter_test/flutter_test.dart';
import 'package:persistent_storage_key_value/core/app_config.dart';
import 'package:persistent_storage_key_value/core/utils/result.dart';
import 'package:persistent_storage_key_value/features/theme/data/repos/theme_repo_fake_impl.dart';
import 'package:persistent_storage_key_value/features/theme/domain/entities/theme_entity.dart';
import 'package:persistent_storage_key_value/features/theme/domain/repos/theme_repo.dart';

void main() {
  late ThemeRepo themeRepo;
  late ThemeVM vm;
  group('ThemeVM', () {
    setUp(() {
      themeRepo = ThemeRepoFakeImpl();
      vm = ThemeVM(themeRepo);
    });
    test('should return the default theme mode by default', () async {
      final result = await vm.getThemeMode();
      final expectedResult = Result.success(AppConfig.defaultThemeMode);
      expect(result, expectedResult);
    });

    test('should return the correct theme mode after setting it', () async {
      for (final mode in AppThemeMode.values) {
        await vm.setThemeMode(mode);
        final result = await vm.getThemeMode();
        final expectedResult = Result.success(mode);
        expect(result, expectedResult);
        expect(vm.command.value, isA<Succeeded<AppThemeMode>>());
      }
    });
  });
}
