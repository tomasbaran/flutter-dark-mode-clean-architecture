import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:persistent_storage_key_value/core/storage/key_value_store_impl.dart';
import 'package:persistent_storage_key_value/features/theme/data/repos/theme_repo_impl.dart';
import 'package:persistent_storage_key_value/features/theme/presentation/theme_vm.dart';
import 'package:provider/provider.dart';

class AppDependencies {
  static Widget buildThemeScreen({required Widget child}) {
    return ChangeNotifierProvider<ThemeVM>(
      create: (_) {
        // Stores and Services
        final keyValueStore = KeyValueStoreImpl();
        // Repos
        final themeRepo = ThemeRepoImpl(keyValueStore: keyValueStore);
        // View Models
        final themeVM = ThemeVM(themeRepo: themeRepo);
        themeVM.init();
        return themeVM;
      },
      child: child,
    );
  }
}
