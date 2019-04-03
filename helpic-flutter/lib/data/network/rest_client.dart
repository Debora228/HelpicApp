import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter_showcase_app/constants/network_exceptions.dart';

class RestClient {

  static final RestClient _restClient = RestClient._internal();


  RestClient._internal();


  factory RestClient() => _restClient;


  final JsonDecoder _decoder = JsonDecoder();


  Future<dynamic> get(String url) {
    return http.get(url).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw NetworkException(
            message: "Error fetching data from server", statusCode: statusCode);
      }
      return _decoder.convert(res);
    });
  }


  Future<dynamic> post(String url, {Map headers, body, encoding}) {
    return http
        .post(url, body: body, headers: headers, encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw NetworkException(
            message: "Error fetching data from server", statusCode: statusCode);
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> getHttps(String url) async {

    print(url);

    HttpClient client = HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    HttpClientRequest request = await client.getUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    HttpClientResponse response = await request.close();

    return response.transform(utf8.decoder).join().then((String body) {

      print(body);

      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw NetworkException(
            message: "Error fetching data from server", statusCode: statusCode);
      }
      return _decoder.convert(body);
    });
  }
}
