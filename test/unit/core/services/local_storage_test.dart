import 'package:flutter_test/flutter_test.dart';
import 'package:hive_test/hive_test.dart';
import 'package:mockito/mockito.dart';
import 'package:hive/hive.dart';
import 'package:guiago/core/services/local_storage.dart';

class MockBox extends Mock implements Box {}

class MockHive extends Mock implements HiveInterface {}

void main() {
  group('HiveStorage', () {
    late HiveStorage hiveStorage;
    late String boxName;

    setUp(() async {
      await setUpTestHive();
      hiveStorage = HiveStorage.instance;
      boxName = 'test';
    });

    test('should be able to open a box', () async {
      final box = await hiveStorage.openBox(boxName);

      expect(box, isNotNull);
      expect(box.name, boxName);
    });

    test('should put a value in the box', () async {
      final hiveData = {'id': 'id', 'name': 'name'};

      await hiveStorage.put(boxName, hiveData);
      final data = await hiveStorage.get(boxName);

      expect(hiveData, data);
    });

    test('should be able to delete data', () async {
      final hiveData = {'id': 'id', 'name': 'name'};
      await hiveStorage.put(boxName, hiveData);

      final result = await hiveStorage.delete(boxName);
      expect(result, 1);
    });

    tearDown(() async {
      await tearDownTestHive();
    });
  });
}
