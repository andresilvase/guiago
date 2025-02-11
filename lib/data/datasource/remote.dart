import 'package:guiago/core/exceptions/api_exception.dart';
import 'package:guiago/core/exceptions/data_source_exception.dart';
import 'package:guiago/core/services/api_service.dart';
import 'package:guiago/data/dto/response.dart';
import 'package:guiago/data/interfaces/interfaces.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final APIService apiService;

  RemoteDataSourceImpl({required this.apiService});

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
