import 'package:flutter/material.dart';
import 'package:persistent_storage_key_value/core/utils/command.dart';

class AppLoadingWrapper<T> extends StatelessWidget {
  final Widget child;
  final ValueNotifier<CommandState<T>> loadingState;
  const AppLoadingWrapper({
    super.key,
    required this.child,
    required this.loadingState,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: loadingState,
      builder: (_, loadingState, __) => (loadingState is Executing<T>)
          ? Stack(
              children: [
                child,
                Container(
                  color: Colors.white,
                  child: const Center(child: CircularProgressIndicator()),
                ),
              ],
            )
          : child,
    );
  }
}
