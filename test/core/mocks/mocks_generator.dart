import 'package:mockito/annotations.dart';
import 'package:persistent_storage_key_value/core/storage/key_value_store.dart';
import 'package:persistent_storage_key_value/features/theme/domain/repos/theme_repo.dart';
import 'package:persistent_storage_key_value/features/theme/presentation/theme_vm.dart';

@GenerateNiceMocks([
  MockSpec<ThemeRepo>(),
  MockSpec<KeyValueStore>(),
  MockSpec<ThemeVM>(),
])
void main() {}
