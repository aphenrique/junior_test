abstract class PhotoException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  PhotoException(this.message, [this.stackTrace]);
}

class PhotoRepositoryException extends PhotoException {
  PhotoRepositoryException(String message) : super(message);
}

class PhotoDatasourceException extends PhotoException {
  PhotoDatasourceException(String message) : super(message);
}
