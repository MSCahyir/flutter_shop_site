import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ferisoft/constant/http_constants.dart';
import 'package:ferisoft/constant/shared_preferences_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseService {
  Dio createDio() {
    Dio dio = Dio();
    dio.options.baseUrl = "https://test.ferisoftdemo.com/api/";

    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      options.headers[HttpConstants.contentType] =
          HttpConstants.applicationJson;
      options.headers[HttpConstants.accept] = HttpConstants.applicationJson;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      options.headers[HttpConstants.authorization] =
          "Bearer ${prefs.get(SharedPreferencesConstants.token) != null ? prefs.get(SharedPreferencesConstants.token).toString() : ""}";

      return handler.next(options);
    }, onResponse: (response, handler) {
      if (response.statusCode == HttpStatus.unauthorized) {
        throw Exception('unauthorized request!');
      }
      return handler.next(response);
    }, onError: (DioError e, handler) {
      return handler.next(e);
    }));

    return dio;
  }
}
