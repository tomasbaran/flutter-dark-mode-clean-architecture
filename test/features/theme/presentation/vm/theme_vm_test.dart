import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:persistent_storage_key_value/core/app_config.dart';
import 'package:persistent_storage_key_value/core/utils/command.dart';
import 'package:persistent_storage_key_value/core/utils/result.dart';
import 'package:persistent_storage_key_value/features/theme/domain/entities/theme_entity.dart';
import 'package:persistent_storage_key_value/features/theme/presentation/theme_vm.dart';

import '../../../../core/mocks/mocks_generator.mocks.dart';

void main() {
  late MockThemeRepo mockThemeRepo;
  late ThemeVM sut;
  group('ThemeVM', () {
    setUp(() {
      mockThemeRepo = MockThemeRepo();
      sut = ThemeVM(themeRepo: mockThemeRepo);
      provideDummy(Result.success(AppConfig.defaultThemeMode));
    });
    test('should return the default theme mode by default', () async {
      // Arrange
      when(
        mockThemeRepo.getThemeMode(),
      ).thenAnswer((_) async => Result.success(AppConfig.defaultThemeMode));
      // Act
      await sut.init();
      // Assert
      verify(mockThemeRepo.getThemeMode());
      final expectedResult = AppConfig.defaultThemeMode;
      expect(
        sut.loadResourcesCommand.state,
        CommandState.succeeded(expectedResult),
      );
    });

    test('should return the correct theme mode after setting it', () async {
      for (final mode in AppThemeMode.values) {
        // Arrange
        when(
          mockThemeRepo.getThemeMode(),
        ).thenAnswer((_) async => Result.success(mode));

        // Act
        await sut.setThemeMode(mode);

        // Assert
        verify(mockThemeRepo.setThemeMode(mode));
        final expectedResult = mode;
        expect(
          sut.setThemeCommand.state,
          CommandState.succeeded(expectedResult),
        );
      }
    });
  });
}
