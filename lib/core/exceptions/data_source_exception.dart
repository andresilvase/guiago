class DataSourceExceptions implements Exception {
  final String message;

  DataSourceExceptions({required this.message});

  @override
  String toString() => 'DataSourceExceptions: $message.';
}
