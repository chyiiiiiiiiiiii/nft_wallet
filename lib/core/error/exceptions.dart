class ServerException implements Exception {
  int errorCode;
  ServerException({required this.errorCode});

  String _getErrorMessage() {
    String message = '';
    switch (errorCode) {
      case 1001:
        break;
      default:
        message = 'get server data - error';
    }
    return message;
  }

  @override
  String toString() {
    return _getErrorMessage();
  }
}

class CacheException implements Exception {
  @override
  String toString() {
    return 'get cache data - error';
  }
}
