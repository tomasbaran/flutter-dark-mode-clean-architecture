import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_storage_key_value/core/app_config.dart';
import 'package:persistent_storage_key_value/core/utils/command.dart';
import 'package:persistent_storage_key_value/core/widgets/app_loading_wrapper.dart';
import 'package:persistent_storage_key_value/features/theme/domain/entities/theme_entity.dart';
import 'package:persistent_storage_key_value/features/theme/presentation/theme_vm.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeVM = context.read<ThemeVM>();
    final themeMode = context.select<ThemeVM, AppThemeMode>(
      (vm) => vm.themeMode,
    );

    return Scaffold(
      backgroundColor: themeMode == AppThemeMode.light
          ? Colors.white
          : Colors.black,
      appBar: AppBar(
        leading: Center(
          child: ValueListenableBuilder<CommandState<void>>(
            valueListenable: themeVM.setThemeCommand.state,
            builder: (_, setThemeCommandState, __) {
              if (setThemeCommandState is Executing<void>) {
                return const Center(
                  child: Text(
                    'saving...',
                    style: TextStyle(fontSize: 12),
                  ),
                );
              }

              if (setThemeCommandState is Failed<void>) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Failed to save theme: ${setThemeCommandState.message}',
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                });
              }

              return const SizedBox.shrink();
            },
          ),
        ),
        title: Text('Dark Mode'),
        actions: [
          CupertinoSwitch(
            value: themeMode == AppThemeMode.dark,
            onChanged: (value) {
              final setToDarkMode = value;
              themeVM.setTheme(
                setToDarkMode ? AppThemeMode.dark : AppConfig.defaultThemeMode,
              );
            },
          ),
        ],
      ),
      body: AppLoadingWrapper<AppThemeMode>(
        loadingState: themeVM.loadThemeCommand.state,
        errorType: AppErrorType.snackbar,
        child: Center(child: Text(themeMode.name)),
      ),
    );
  }
}
