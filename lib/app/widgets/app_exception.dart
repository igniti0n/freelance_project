import 'package:get/get_connect/http/src/response/response.dart';

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "");
}

class InvalidInputException extends AppException {
  InvalidInputException([String message]) : super(message, "Invalid Input: ");
}

///Parse status response
dynamic parseStatusCode(Response<dynamic> response) {
  switch (response.statusCode) {
    case 400:
      throw BadRequestException(response.statusText);
    case 401:
    case 403:
      throw UnauthorisedException(response.statusText);
    case 500:
    default:
      throw FetchDataException(response.statusText);
  }
}
