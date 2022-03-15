import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:territoriei/utils/interfaces/ihttp_client.dart';

class DioHttpClient implements IHttpClient {
  final Dio client;

  DioHttpClient({required this.client});

  HttpClientResponse _parse(Response response) async {
    List<dynamic> result;
    final data = response.data;
    try {
      if (data != null) {
        result = jsonDecode(data);
      } else {
        throw Exception('data=$data');
      }
    } catch (e) {
      result = [
        {
          'message': data,
          'exception': e.toString(),
        }
      ];
    }
    return result;
  }

  HttpClientResponse request(RequestOptions options) async {
    try {
      final Response response = await client.fetch<String>(options);

      return _parse(response);
    } catch (e) {
      log('No dio expection');
      log(e.toString());
      if (e is DioError) {
        if (e.response != null) {
          final response = e.response!;
          final Map<String, dynamic> json = {
            'message':
                response.data != null ? '${response.data}' : e.toString(),
          };
          final statusCode = response.statusCode;

          if (statusCode != null) {
            if (statusCode >= 400 && statusCode < 500) {
              if (statusCode == 401) {
                throw const ConnectionException();
              }
              throw ClientErrorException(
                code: statusCode,
                message: '${json['message']}',
              );
            }

            if (statusCode >= 500 && statusCode < 600) {
              throw ServerErrorException(
                code: statusCode,
                message: '${json['message']}',
              );
            }
          }
        } else {
          throw const ConnectionException();
        }
      }
    }

    throw const UnknownApiException();
  }

  @override
  HttpClientResponse delete(String url,
      {Map<String, dynamic> headers = const {}}) {
    return request(
      RequestOptions(
        path: url,
        method: 'DELETE',
        headers: headers,
      ),
    );
  }

  @override
  HttpClientResponse get(String url,
      {Map<String, dynamic> headers = const {}}) {
    return request(
      RequestOptions(
        path: url,
        method: 'GET',
        headers: headers,
      ),
    );
  }

  @override
  HttpClientResponse patch(String url,
      {Map<String, dynamic> body = const {},
      Map<String, dynamic> headers = const {}}) {
    return request(
      RequestOptions(
        path: url,
        method: 'PATCH',
        headers: headers,
        data: jsonEncode(body),
      ),
    );
  }

  @override
  HttpClientResponse post(String url,
      {Map<String, dynamic> body = const {},
      Map<String, dynamic> headers = const {}}) {
    return request(
      RequestOptions(
        path: url,
        method: 'POST',
        headers: headers,
        data: jsonEncode(body),
      ),
    );
  }

  @override
  HttpClientResponse put(String url,
      {Map<String, dynamic> body = const {},
      Map<String, dynamic> headers = const {}}) {
    return request(
      RequestOptions(
        path: url,
        method: 'PUT',
        headers: headers,
        data: jsonEncode(body),
      ),
    );
  }
}
