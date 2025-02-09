import 'package:guiago/data/datasource/datasource.dart';
import 'package:guiago/data/dto/response.dart';

class LocalResponseDataSource implements DataSource {
  @override
  Future<APIResponse> getData() async {
    final response = {'local': 'response'};

    final responseData = APIResponse.fromJson(response);

    return responseData;
  }
}
