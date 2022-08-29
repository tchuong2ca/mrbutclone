import 'dart:io';

import 'package:dio/dio.dart';
class ApiProvider {
  final Dio _dio = Dio();
  final String _baseUrl =  'http://api.ongbut.edu.vn/';

  Future get(String url, Map) async {
    try {
      final response = await _dio.get(
          _baseUrl+url,
          options: Options(
              headers: {
                'Accept': '*/*',
                'Accept-Encoding': 'gzip, deflate, br',
                'Connection': 'keep-alive'
              }),
          queryParameters: Map
      );
      return response;
    } catch (error, stacktrace) {
          print("Exception occured: $error stackTrace: $stacktrace");
        }
  }
}
