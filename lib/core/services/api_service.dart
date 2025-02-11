import 'package:guiago/core/exceptions/api_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  final http.Client client;
  final String baseUrl;

  APIService({required this.baseUrl, required this.client});

  Future<Map<String, dynamic>> get() async {
    final response = await client.get(Uri.parse(baseUrl));

    return handleResponse(response);
  }

  Map<String, dynamic> handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final decodedBody = utf8.decode(response.bodyBytes);
      return jsonDecode(decodedBody);
    } else {
      throw APIException(
        statusCode: response.statusCode,
        message: response.body,
      );
    }
  }
}
