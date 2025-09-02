abstract class KeyValueStore {
  Future<bool> writeString(String key, String value);
  Future<String> readString(String key);
}
