import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient extends http.BaseClient {
  final baseUri = Uri.parse('https://example.com/base');
  final http.Client _inner = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _inner.send(request).then((response) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response;
      } else {
        throw Exception('$response');
      }
    });
  }

  @override
  Future<http.Response> get(Uri url, {Map<String, String>? headers}) {
    return super.get(baseUri.resolveUri(url), headers: headers);
  }

  @override
  Future<http.Response> post(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return super.get(baseUri.resolveUri(url), headers: headers);
  }

  @override
  Future<http.Response> put(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return super.put(baseUri.resolveUri(url),
        headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<http.Response> patch(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return super.patch(baseUri.resolveUri(url),
        headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<http.Response> delete(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return super.delete(baseUri.resolveUri(url),
        headers: headers, body: body, encoding: encoding);
  }

  @override
  void close() {
    _inner.close();
  }
}
