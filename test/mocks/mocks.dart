import 'package:guiago/core/repositories/repository.dart';
import 'package:guiago/data/datasource/local.dart';
import 'package:guiago/data/datasource/remote.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  RemoteDataSource,
  LocalDataSource,
  Repository,
])
void main() {}
