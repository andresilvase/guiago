class DataSourceException implements Exception {
  final String dataSource;
  final String message;

  DataSourceException({required this.dataSource, required this.message});

  @override
  String toString() => 'DataSourceException: $message.';
}
