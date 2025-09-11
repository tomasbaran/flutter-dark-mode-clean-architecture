import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:persistent_storage_key_value/core/app_config.dart';
import 'package:persistent_storage_key_value/features/theme/domain/entities/theme_entity.dart';
import 'package:persistent_storage_key_value/features/theme/presentation/theme_vm.dart';
import 'package:persistent_storage_key_value/features/theme/presentation/widgets/theme_screen.dart';
import 'package:provider/provider.dart';

import '../../../../core/mocks/mocks_generator.mocks.dart';

void main() {
  group('ThemeScreen', () {
    late MockThemeVM mockThemeVM;
    setUp(() {
      mockThemeVM = MockThemeVM();
    });
    testWidgets('should display the correct theme mode and switch value', (
      tester,
    ) async {
      // Arrange
      when(mockThemeVM.themeMode).thenReturn(AppConfig.defaultThemeMode);
      // Act
      final themeScreen = MaterialApp(
        home: ChangeNotifierProvider<ThemeVM>.value(
          value: mockThemeVM,
          child: const ThemeScreen(),
        ),
      );

      await tester.pumpWidget(themeScreen);

      // Assert
      expect(find.text(AppThemeMode.light.name), findsOneWidget);
      expect(
        tester.widget<CupertinoSwitch>(find.byType(CupertinoSwitch)).value,
        AppConfig.defaultThemeMode == AppThemeMode.light
            ? false // Switch should be off for light theme
            : true,
      );
    });

    testWidgets('should call setTheme when switch is tapped', (tester) async {
      // Act
      final themeScreen = MaterialApp(
        home: ChangeNotifierProvider<ThemeVM>.value(
          value: mockThemeVM,
          child: const ThemeScreen(),
        ),
      );

      await tester.pumpWidget(themeScreen);
      await tester.tap(find.byType(CupertinoSwitch));
      await tester.pump();

      // Assert
      verify(mockThemeVM.setTheme(AppThemeMode.dark));
    });
  });
}
