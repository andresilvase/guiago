import 'package:guiago/core/exceptions/api_exception.dart';
import 'package:guiago/core/exceptions/data_source_exception.dart';
import 'package:guiago/data/interfaces/data_source.dart';
import 'package:guiago/core/services/api_service.dart';
import 'package:guiago/data/dto/response.dart';

class RemoteDataSource implements DataSource {
  final APIService apiService;

  RemoteDataSource({required this.apiService});

  @override
  Future<Response> getData() async {
    try {
      final response = await apiService.get();

      final responseData = Response.fromJson(response);

      return responseData;
    } on APIException catch (_) {
      rethrow;
    } on Exception catch (e) {
      throw DataSourceException(message: e.toString(), dataSource: 'RemoteDataSource');
    }
  }
}
