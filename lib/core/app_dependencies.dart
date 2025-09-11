import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:persistent_storage_key_value/core/storage/key_value_store.dart';
import 'package:persistent_storage_key_value/core/storage/key_value_store_impl.dart';
import 'package:persistent_storage_key_value/features/theme/data/repos/theme_repo_impl.dart';
import 'package:persistent_storage_key_value/features/theme/domain/repos/theme_repo.dart';
import 'package:persistent_storage_key_value/features/theme/presentation/theme_vm.dart';
import 'package:provider/provider.dart';

/// Manages application dependencies with lazy initialization.
///
/// Dependencies are created only when first accessed, improving startup performance.
class AppDependencies {
  // For testing
  // setUp(() {
  //   AppDependencies.resetDependencies();
  //   AppDependencies.setDependencies(
  //     keyValueStore: MockKeyValueStore(),
  //     themeRepo: MockThemeRepo(),
  //   );
  // });

  // tearDown(() {
  //   AppDependencies.resetDependencies();
  // });

  //   // Testing helpers
  //   static void setDependencies({
  //     KeyValueStoreImpl? keyValueStore,
  //     ThemeRepoImpl? themeRepo,
  //   }) {
  //     _keyValueStore = keyValueStore;
  //     _themeRepo = themeRepo;
  //   }

  //   static void resetDependencies() {
  //     _keyValueStore = null;
  //     _themeRepo = null;
  //   }

  // Stores and Services
  static KeyValueStore? _keyValueStore;
  // Repos
  static ThemeRepo? _themeRepo;

  // Lazy initialization of dependencies
  static KeyValueStore get keyValueStore =>
      _keyValueStore ??= KeyValueStoreImpl();
  static ThemeRepo get themeRepo =>
      _themeRepo ??= ThemeRepoImpl(keyValueStore: keyValueStore);

  // While buildThemeScreen is static, VMs are created only when needed (lazy) by the Provider's create callback
  static Widget buildThemeScreen({required Widget child}) {
    return ChangeNotifierProvider<ThemeVM>(
      // create: (_) {
      //   // View Models
      //   final themeVM = ThemeVM(themeRepo: themeRepo);
      //   themeVM.init();
      //   return themeVM;
      // },

      // This runs only when the Provider is first accessed
      create: (_) => ThemeVM(themeRepo: themeRepo)..init(),
      child: child,
    );
  }
}
