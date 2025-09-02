import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:persistent_storage_key_value/core/app_config.dart';
import 'package:persistent_storage_key_value/core/utils/result.dart';
import 'package:persistent_storage_key_value/features/theme/data/repos/theme_repo_fake_impl.dart';
import 'package:persistent_storage_key_value/features/theme/domain/entities/theme_entity.dart';

import '../../../../core/mocks/mocks_generator.mocks.dart';

void main() {
  group('ThemeRepoFakeImpl', () {
    late ThemeRepoImpl sut;
    late MockKeyValueStore mockKeyValueStore;

    setUp(() {
      mockKeyValueStore = MockKeyValueStore();
      sut = ThemeRepoImpl(mockKeyValueStore);
    });

    test('should return the default theme mode by default', () async {
      // Arrange
      when(
        mockKeyValueStore.readString('theme_mode'),
      ).thenReturn(Future.value(AppConfig.defaultThemeMode.name));
      // Act
      final result = await sut.getThemeMode();
      // Assert
      final expectedResult = Result.success(AppConfig.defaultThemeMode);
      expect(result, expectedResult);
    });

    test('should return correct mode after setting it', () async {
      for (final mode in AppThemeMode.values) {
        // Arrange
        when(
          mockKeyValueStore.readString('theme_mode'),
        ).thenReturn(Future.value(mode.name));
        // Act
        await sut.setThemeMode(mode);
        // Assert
        final result = await sut.getThemeMode();
        final expectedResult = Result.success(mode);
        verify(mockKeyValueStore.writeString('theme_mode', mode.name));
        expect(result, expectedResult);
      }
    });
  });
}
