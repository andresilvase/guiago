import 'package:guiago/core/exceptions/api_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIServiceParams {
  final String baseUrl;
  final http.Client client;

  APIServiceParams({required this.baseUrl, required this.client});
}

class APIService {
  final APIServiceParams params;

  APIService({required this.params});

  Future<Map<String, dynamic>> get() async {
    final response = await params.client.get(Uri.parse(params.baseUrl));

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
