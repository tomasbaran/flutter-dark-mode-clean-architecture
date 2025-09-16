import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:persistent_storage_key_value/core/utils/command.dart';
import 'package:persistent_storage_key_value/core/widgets/app_loading_wrapper.dart';
import 'package:persistent_storage_key_value/core/widgets/app_error_bottom_sheet.dart';

void main() {
  group('AppLoadingWrapper', () {
    late ValueNotifier<CommandState<String>> fakeLoadingState;
    late Widget fakeChild;

    setUp(() {
      // Arrange
      fakeLoadingState = ValueNotifier<CommandState<String>>(
        CommandState.idle(),
      );
      fakeChild = const Text('Test Child');
    });

    tearDown(() {
      fakeLoadingState.dispose();
    });

    testWidgets('shows child when state is idle', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: AppLoadingWrapper(
            loadingState: fakeLoadingState,
            child: fakeChild,
          ),
        ),
      );

      // Assert
      expect(find.text('Test Child'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('shows loading indicator when state is executing', (
      WidgetTester tester,
    ) async {
      // Arrange
      fakeLoadingState.value = CommandState.executing();

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: AppLoadingWrapper(
            loadingState: fakeLoadingState,
            child: fakeChild,
          ),
        ),
      );

      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Test Child'), findsOneWidget);
    });

    testWidgets('shows snackbar when error occurs with snackbar type', (
      WidgetTester tester,
    ) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppLoadingWrapper(
              loadingState: fakeLoadingState,
              errorType: AppErrorType.snackbar,
              child: fakeChild,
            ),
          ),
        ),
      );

      // Trigger the error state after the widget is built
      fakeLoadingState.value = CommandState.failed('Test Error');
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Test Error'), findsOneWidget);
    });

    testWidgets('shows bottom sheet when error occurs with bottomSheet type', (
      WidgetTester tester,
    ) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: AppLoadingWrapper(
            loadingState: fakeLoadingState,
            errorType: AppErrorType.bottomSheet,
            child: fakeChild,
          ),
        ),
      );

      // Trigger the error state after the widget is built
      fakeLoadingState.value = CommandState.failed('Test Error');
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(AppErrorBottomSheet), findsOneWidget);
      expect(find.text('Test Error'), findsOneWidget);
    });

    testWidgets('does not show error UI when error type is silent', (
      WidgetTester tester,
    ) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: AppLoadingWrapper(
            loadingState: fakeLoadingState,
            errorType: AppErrorType.silent,
            child: fakeChild,
          ),
        ),
      );

      // Trigger the error state after the widget is built
      fakeLoadingState.value = CommandState.failed('Test Error');
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(SnackBar), findsNothing);
      expect(find.byType(AppErrorBottomSheet), findsNothing);
      expect(find.text('Test Child'), findsOneWidget);
    });
  });
}
