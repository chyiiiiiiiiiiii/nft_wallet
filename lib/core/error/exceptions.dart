class ServerException implements Exception {
  int errorCode;
  ServerException({required this.errorCode});

  String _getErrorMessage() {
    String message = '';
    switch (errorCode) {
      case 1001:
        break;
      default:
        message = 'ServerException - error';
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
    return 'CacheException - error';
  }
}

class Web3Exception implements Exception {
  String? msg;

  Web3Exception({this.msg});

  @override
  String toString() {
    return msg ?? 'Web3Exception - error';
  }
}
