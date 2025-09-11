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
    });
    test(
      'should 1. return the default theme mode by default and 2. get the theme mode from the repository',
      () async {
        // 1. Get the default theme mode
        expect(sut.themeMode, AppConfig.defaultThemeMode);

        // 2. Get the theme mode from the repository
        final expectedResult = AppConfig.defaultThemeMode == AppThemeMode.light
            ? AppThemeMode.dark
            : AppThemeMode.light;
        provideDummy(Result.success(expectedResult));
        when(
          mockThemeRepo.getThemeMode(),
        ).thenAnswer((_) async => Result.success(expectedResult));

        bool listenerCalled = false;
        sut.addListener(() => listenerCalled = true);

        // Act
        await sut.init();
        // Assert
        verify(mockThemeRepo.getThemeMode());
        expect(listenerCalled, true);
        expect(sut.themeMode, expectedResult);
      },
    );

    test('should return the correct theme mode after setting it', () async {
      for (final mode in AppThemeMode.values) {
        // Arrange
        provideDummy<Result<void>>(Result.success(null));
        provideDummy<Result<AppThemeMode>>(Result.success(mode));
        when(
          mockThemeRepo.getThemeMode(),
        ).thenAnswer((_) async => Result.success(mode));
        when(
          mockThemeRepo.setThemeMode(mode),
        ).thenAnswer((_) async => Result.success(null));

        // Act
        await sut.init();

        bool setThemeListenerCalled = false;
        sut.addListener(() => setThemeListenerCalled = true);
        await sut.setTheme(mode);

        // Assert
        verify(mockThemeRepo.getThemeMode());
        expect(setThemeListenerCalled, true);
        expect(sut.themeMode, mode);
        verify(mockThemeRepo.setThemeMode(mode));
      }
    });
  });
}
