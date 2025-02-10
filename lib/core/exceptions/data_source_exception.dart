class DataSourceExceptions implements Exception {
  final String dataSource;
  final String message;

  DataSourceExceptions({required this.dataSource, required this.message});

  @override
  String toString() => 'DataSourceExceptions: $message.';
}
