import 'package:flutter/material.dart';
import 'package:persistent_storage_key_value/core/utils/command.dart';
import 'package:persistent_storage_key_value/core/widgets/app_error_bottom_sheet.dart';

enum AppErrorType {
  silent,
  snackbar,
  bottomSheet,
}

class AppLoadingWrapper<T> extends StatefulWidget {
  final Widget child;
  final ValueNotifier<CommandState<T>> loadingState;
  final AppErrorType errorType;
  const AppLoadingWrapper({
    super.key,
    required this.child,
    required this.loadingState,
    this.errorType = AppErrorType.snackbar,
  });

  @override
  State<AppLoadingWrapper<T>> createState() => _AppLoadingWrapperState<T>();
}

class _AppLoadingWrapperState<T> extends State<AppLoadingWrapper<T>> {
  @override
  void initState() {
    super.initState();
    widget.loadingState.addListener(_onStateChange);
  }

  @override
  void dispose() {
    widget.loadingState.removeListener(_onStateChange);
    super.dispose();
  }

  _onError(Failed<T> failedState) {
    switch (widget.errorType) {
      case AppErrorType.snackbar:
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(failedState.message)),
          );
        }
        break;
      case AppErrorType.bottomSheet:
        if (mounted) {
          showModalBottomSheet(
            context: context,
            builder: (context) =>
                AppErrorBottomSheet(message: failedState.message),
          );
        }
        break;
      case AppErrorType.silent:
        break;
    }
  }

  void _onStateChange() {
    final state = widget.loadingState.value;
    if (state is! Failed<T>) return;

    _onError(state);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.loadingState,
      builder: (_, loadingState, __) {
        if (loadingState is Executing<T>) {
          return Stack(
            children: [
              widget.child,
              Container(
                color: Colors.white,
                child: const Center(child: CircularProgressIndicator()),
              ),
            ],
          );
        }
        return widget.child;
      },
    );
  }
}
