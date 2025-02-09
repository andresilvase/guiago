import 'package:guiago/data/datasource/datasource.dart';
import 'package:guiago/core/services/api_service.dart';
import 'package:guiago/data/dto/response.dart';

class RemoteResponseDataSource implements DataSource {
  final APIService apiService;

  RemoteResponseDataSource({required this.apiService});

  @override
  Future<APIResponse> getData() async {
    final response = await apiService.get();

    final responseData = APIResponse.fromJson(response);

    return responseData;
  }
}
