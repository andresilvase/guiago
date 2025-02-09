import 'package:guiago/data/datasource/datasource.dart';
import 'package:guiago/data/dto/response.dart';

class LocalResponseDataSource implements DataSource {
  @override
  Future<PayloadResponse> getData() async {
    final response = {'local': 'response'};

    final responseData = PayloadResponse.fromJson(response);

    return responseData;
  }
}
