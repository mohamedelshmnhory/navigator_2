import 'dart:io';
import 'package:beautyapp/shared/components/constants.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() async {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://bradabeauty-ac.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',
    };
    return await dio.get(
      url,
      queryParameters: query,
      options:
          Options(headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}),
    );
  }

  static Future<Response> postData({
    required String url,
    required data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {'Accept': 'application/json'};
    return dio.post(
      url,
      queryParameters: query,
      data: data,
      options:
          Options(headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}),
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',
    };
    return dio.delete(
      url,
      queryParameters: query,
      options: Options(
          headers: {HttpHeaders.authorizationHeader: 'Bearer $userToken'}),
    );
  }

  static Future<Response> uploadImage(File file, url) async {
    FormData data = FormData.fromMap({
      '_method': 'PUT',
      "image": await MultipartFile.fromFile(
        file.path,
      ),
    });
    return dio.post(
      url,
      data: data,
      options: Options(headers: {
        HttpHeaders.authorizationHeader: 'Bearer $userToken',
        'Accept': 'application/json',
      }),
    );
  }

  static Future<Response> putData({
    required String url,
    required data,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',
    };
    return dio.put(
      url,
      queryParameters: query,
      data: data,
      options: Options(
          headers: {HttpHeaders.authorizationHeader: 'Bearer $userToken'}),
    );
  }
}
