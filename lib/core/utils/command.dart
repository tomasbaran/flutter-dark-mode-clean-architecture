import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:persistent_storage_key_value/core/utils/result.dart';

part 'command.freezed.dart';

@freezed
sealed class CommandState<T> with _$CommandState<T> {
  const factory CommandState.idle() = Idle<T>;
  const factory CommandState.executing() = Executing<T>;
  const factory CommandState.succeeded(T value) = Succeeded<T>;
  const factory CommandState.failed(String message) = Failed<T>;
}

class Command<T> {
  final Future<Result<T>> Function() _execute;
  Command({required Future<Result<T>> Function() execute}) : _execute = execute;

  final _state = ValueNotifier<CommandState<T>>(CommandState.idle());
  get state => _state.value;

  execute() async {
    if (state is Executing<T>) return;
    _state.value = CommandState.executing();

    final result = await _execute();
    result.when(
      success: (value) => _state.value = CommandState.succeeded(value),
      error: (message) => _state.value = CommandState.failed(message),
    );
  }
}
