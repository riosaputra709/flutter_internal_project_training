class AppException implements Exception {
  final dynamic message;
  final dynamic prefix;

  AppException([this.message, this.prefix]);

  @override
  String toString() {
    // TODO: implement toString
    return "$prefix$message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message,"Error During Communication: ");
}

class BadRequestExeption extends AppException {
  BadRequestExeption([message]) : super(message, "Invalid Request: ");
}

class InvalidSessionExpression extends AppException {
  InvalidSessionExpression([String? message]) : super(message,"Invalid Session: ");
}