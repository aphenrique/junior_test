abstract class PhotoException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  PhotoException(this.message, [this.stackTrace]);
}

class PhotoParamsException extends PhotoException {
  PhotoParamsException(String message) : super(message);
}

class PhotoRepositoryException extends PhotoException {
  PhotoRepositoryException(String message) : super(message);
}

class PhotoDatasourceException extends PhotoException {
  PhotoDatasourceException(String message) : super(message);
}

class LostInternetConnection extends PhotoException {
  LostInternetConnection(String message) : super(message);
}
