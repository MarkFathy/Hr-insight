class ServerException implements Exception {
  final String message;

  ServerException(this.message);
}

class EmptyCacheException implements Exception {
  final String message;
  EmptyCacheException(this.message);
}
