import 'package:guiago/core/utils/constants.dart';
import 'package:guiago/data/interfaces/local_storage.dart';
import 'package:hive/hive.dart';

class HiveStorage extends LocalStorage {
  HiveStorage._();

  static HiveStorage get instance => HiveStorage._();

  @override
  Future<int> put(String key, Map<String, dynamic> value) async {
    final Box box = await _openBox(Constants.storageKey);
    final prevLength = box.length;

    await box.put(key, value);

    final newLength = box.length;
    return newLength > prevLength ? 1 : 0;
  }

  @override
  Future<Map<String, dynamic>> get(String key) async {
    final Box box = await _openBox(Constants.storageKey);

    return box.get(Constants.storageKey) ?? {};
  }

  @override
  Future<int> delete(String key) async {
    final Box box = await _openBox(Constants.storageKey);
    final prevLength = box.length;

    box.delete(Constants.storageKey);

    final newLength = box.length;

    return newLength < prevLength ? 1 : 0;
  }

  Future<Box> _openBox(String boxName) async {
    return await Hive.openBox(boxName);
  }
}
