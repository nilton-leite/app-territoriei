typedef HttpClientResponse = Future<Map<String, dynamic>>;

abstract class ApiException implements Exception {
  const ApiException();
}

class ConnectionException extends ApiException {
  const ConnectionException();
}

class ServerErrorException extends ApiException {
  final int? code;
  final String? message;

  const ServerErrorException({this.code, this.message});
}

class ClientErrorException extends ApiException {
  final int? code;
  final String? message;

  const ClientErrorException({this.code, this.message});
}

class UnknownApiException extends ApiException {
  const UnknownApiException();
}

abstract class IHttpClient {
  HttpClientResponse get(
    String url, {
    Map<String, dynamic> headers = const {},
  });

  HttpClientResponse delete(
    String url, {
    Map<String, dynamic> headers = const {},
  });

  HttpClientResponse post(
    String url, {
    Map<String, dynamic> body = const {},
    Map<String, dynamic> headers = const {},
  });

  HttpClientResponse patch(
    String url, {
    Map<String, dynamic> body = const {},
    Map<String, dynamic> headers = const {},
  });

  HttpClientResponse put(
    String url, {
    Map<String, dynamic> body = const {},
    Map<String, dynamic> headers = const {},
  });
}
