import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:io';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('initializeApp', () {
    group('dotenv', () {
      final String baseUrl = 'https://www.jsonkeeper.com/b/1IXK';
      setUp(() {
        dotenv.testLoad(fileInput: File('test/unit/.env').readAsStringSync());
      });
      test('when .env is loaded we should be able to get the .env variables', () {
        expect(dotenv.env['BASE_URL'], baseUrl);
      });
      test('when getting a variable that is not in .env, we should get the fallback we defined', () {
        expect(dotenv.get('BASE_URL', fallback: baseUrl), baseUrl);
      });
      test('when getting a vairable that is not in .env, we should get an error thrown', () {
        expect(() => dotenv.get('FULL_URL'), throwsAssertionError);
      });
    });
  });
}
