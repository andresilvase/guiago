import 'package:guiago/data/interfaces/interfaces.dart';
import 'package:hive/hive.dart';

class HiveStorage extends LocalStorage {
  HiveStorage._();

  static HiveStorage get instance => HiveStorage._();

  @override
  Future<int> put(String key, Map<String, dynamic> value) async {
    final Box box = await openBox(key);
    final prevLength = box.length;

    await box.put(key, value);

    final newLength = box.length;
    return newLength > prevLength ? 1 : 0;
  }

  @override
  Future<Map<String, dynamic>> get(String key) async {
    final Box box = await openBox(key);

    return box.get(key) ?? {};
  }

  @override
  Future<int> delete(String key) async {
    final Box box = await openBox(key);
    final prevLength = box.length;

    box.delete(key);

    final newLength = box.length;

    return newLength < prevLength ? 1 : 0;
  }

  Future<Box> openBox(String boxName) async {
    return await Hive.openBox(boxName);
  }
}
