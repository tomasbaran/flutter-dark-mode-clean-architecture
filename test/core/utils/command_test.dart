import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:persistent_storage_key_value/core/utils/command.dart';
import 'package:persistent_storage_key_value/core/utils/result.dart';

void main() {
  Future<Result<int>> fakeFunction(_) async => Result.success(1);
  Future<Result<int>> fakeFunctionWithArgument(bool arg) async =>
      arg ? Result.success(1) : Result.error('Error');

  group('Command', () {
    test('happy path minimal', () async {
      final sut = Command(execute: fakeFunction);

      expect(sut.state, CommandState<int>.idle());
      final future = sut.execute(null);
      expect(sut.state, CommandState<int>.executing());
      await future;
      expect(sut.state, CommandState<int>.succeeded(1));
    });

    test('happy path minimal with argument', () async {
      final sut = Command<int, bool>(execute: fakeFunctionWithArgument);

      expect(sut.state, CommandState<int>.idle());
      final future = sut.execute(true);
      expect(sut.state, CommandState<int>.executing());
      await future;
      expect(sut.state, CommandState<int>.succeeded(1));
    });

    test('failed case with argument', () async {
      final sut = Command<int, bool>(execute: fakeFunctionWithArgument);

      expect(sut.state, CommandState<int>.idle());
      final future = sut.execute(false);
      expect(sut.state, CommandState<int>.executing());
      await future;
      expect(sut.state, CommandState<int>.failed('Error'));
    });

    test('should not execute if already executing', () async {
      int executed = 0;
      final completer = Completer<void>();
      final sut = Command<void, dynamic>(
        execute: (_) async {
          await completer.future; // Keep the execution alive
          executed++;
          return Result.success(null);
        },
      );

      expect(sut.state, CommandState<void>.idle());

      // Start first execution
      final first = sut.execute(null);
      expect(sut.state, CommandState<void>.executing());
      expect(executed, 0);

      // Start second execution
      final second = sut.execute(null);
      expect(sut.state, CommandState<void>.executing());
      expect(executed, 0);

      completer.complete();
      await first;
      expect(sut.state, CommandState<void>.succeeded(null));
      expect(executed, 1);

      // The second execution should be ignored, so executed should not be incremented
      await second;
      expect(sut.state, CommandState<void>.succeeded(null));
      expect(executed, 1);
    });
  });
}
