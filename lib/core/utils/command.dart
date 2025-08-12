import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'command.freezed.dart';

@freezed
sealed class CommandState<T> with _$CommandState<T> {
  const factory CommandState.idle() = Idle<T>;
  const factory CommandState.executing() = Executing<T>;
  const factory CommandState.succeeded(T value) = Succeeded<T>;
  const factory CommandState.failed(String message) = Failed<T>;
}

class Command<T> {
  final Future<T> Function() _execute;
  Command({required Future<T> Function() execute}) : _execute = execute;

  final _state = ValueNotifier<CommandState<T>>(CommandState.idle());
  get state => _state.value;

  execute() async {
    if (state is Executing<T>) return;
    _state.value = CommandState.executing();
    try {
      final result = await _execute();
      _state.value = CommandState.succeeded(result);
    } catch (e) {
      _state.value = CommandState.failed('Command failed:$e');
    }
  }
}
