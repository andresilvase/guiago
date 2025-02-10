abstract class LocalStorage {
  Future<int> put(String key, Map<String, dynamic> value);
  Future<Map<String, dynamic>> get(String key);
  Future<int> delete(String key);
}
