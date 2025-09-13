import 'package:persistent_storage_key_value/core/storage/key_value_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeyValueStoreImpl implements KeyValueStore {
  SharedPreferences? _prefs;
  get _isInitialized => _prefs != null;

  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> _ensureInitialized() async {
    if (!_isInitialized) await _init();
  }

  @override
  Future<bool> writeString(String key, String value) async {
    await _ensureInitialized();
    await Future.delayed(const Duration(seconds: 1));
    // throw Exception('Error writing string to key value store');
    return await _prefs!.setString(key, value);
  }

  @override
  Future<String?> readString(String key) async {
    await _ensureInitialized();
    await Future.delayed(const Duration(seconds: 1));
    // throw Exception('Error reading string from key value store');
    return _prefs!.getString(key);
  }
}
