import 'package:guiago/core/exceptions/api_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  final http.Client client;
  final String baseUrl;

  APIService({required this.baseUrl, required this.client});

  Future<dynamic> get() async {
    final response = await client.get(Uri.parse(baseUrl));

    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw APIException(
        statusCode: response.statusCode,
        message: response.body,
      );
    }
  }
}
