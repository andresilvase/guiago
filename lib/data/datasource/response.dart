import 'package:guiago/core/services/api_service.dart';
import 'package:guiago/data/datasource/datasource.dart';

class ResponseDataSource implements DataSource {
  final APIService apiService;

  ResponseDataSource({required this.apiService});

  @override
  Future<dynamic> getData() async {
    final response = await apiService.get();
    return response;
  }
}
