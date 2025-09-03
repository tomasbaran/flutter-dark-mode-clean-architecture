import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:persistent_storage_key_value/core/storage/key_value_store.dart';
import 'package:persistent_storage_key_value/core/storage/key_value_store_impl.dart';
import 'package:persistent_storage_key_value/features/theme/data/repos/theme_repo_impl.dart';
import 'package:persistent_storage_key_value/features/theme/domain/repos/theme_repo.dart';
import 'package:persistent_storage_key_value/features/theme/presentation/theme_vm.dart';
import 'package:provider/provider.dart';

class AppDependencies {
  // Stores and Services
  static KeyValueStore get keyValueStore => KeyValueStoreImpl();
  // Repos
  static ThemeRepo get themeRepo => ThemeRepoImpl(keyValueStore: keyValueStore);
  // View Models
  static ThemeVM get themeVM => ThemeVM(themeRepo: themeRepo);

  static Widget buildThemeScreen({required Widget child}) {
    return Provider<ThemeVM>(
      create: (context) => themeVM..init(),
      child: child,
    );
  }
}
