class APIException implements Exception {
  final String message;
  final int statusCode;

  APIException({required this.message, required this.statusCode});

  @override
  String toString() => 'APIException: $message (Status Code: $statusCode)';
}
