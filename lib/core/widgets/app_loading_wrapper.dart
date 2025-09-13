import 'package:flutter/material.dart';
import 'package:persistent_storage_key_value/core/utils/command.dart';

class AppLoadingWrapper<T> extends StatefulWidget {
  final Widget child;
  final ValueNotifier<CommandState<T>> loadingState;
  const AppLoadingWrapper({
    super.key,
    required this.child,
    required this.loadingState,
  });

  @override
  State<AppLoadingWrapper<T>> createState() => _AppLoadingWrapperState<T>();
}

class _AppLoadingWrapperState<T> extends State<AppLoadingWrapper<T>> {
  @override
  void initState() {
    super.initState();
    widget.loadingState.addListener(_onError);
  }

  @override
  void dispose() {
    widget.loadingState.removeListener(_onError);
    super.dispose();
  }

  void _onError() {
    final state = widget.loadingState.value;
    if (state is Failed<T>) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.message)),
        );
      }
    }
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
