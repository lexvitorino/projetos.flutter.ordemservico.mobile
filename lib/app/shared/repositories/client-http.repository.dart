import 'package:dio/dio.dart';
import 'package:osmobile/app/shared/repositories/interceptors/client-http.interceptor.dart';
import 'package:osmobile/app/shared/repositories/interfaces/client-http.interface.dart';

import '../constants.dart';

class ClientHttpRepository implements IClientHttp {
  Dio dio;

  ClientHttpRepository() {
    if (dio == null) {
      BaseOptions options = new BaseOptions(
        baseUrl: BASE_URL,
        connectTimeout: 60 * 500,
        receiveTimeout: 60 * 500,
      );
      dio = new Dio(options);
      dio.interceptors.add(HttpClientInterceptor());
    }
  }

  fromJson(Map<String, dynamic> json) {
    return json['error'];
  }

  List<String> throwCustomError(DioError e) {
    List<String> errors = [];
    if (e.response != null) {
      errors.add(fromJson(e.response.data));
      return errors;
    } else if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      errors.add(e.message);
      return errors;
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      errors.add(e.message);
      return errors;
    } else {
      print(e);
      errors.add("Internal Server Error");
      return errors;
    }
  }

  @override
  Future get(String url) async {
    try {
      var response = await dio.get(url);
      return response.data;
    } on DioError catch (e) {
      throw (throwCustomError(e));
    }
  }

  @override
  Future post(String url, dynamic data) async {
    try {
      var response = await dio.post(url, data: data);
      return response.data;
    } on DioError catch (e) {
      throw (throwCustomError(e));
    }
  }

  @override
  Future put(String url, dynamic data) async {
    try {
      var response = await dio.put(url, data: data);
      return response.data;
    } on DioError catch (e) {
      throw (throwCustomError(e));
    }
  }

  @override
  Future delete(String url, dynamic data) async {
    try {
      var response = await dio.delete(url, data: data);
      return response.data;
    } on DioError catch (e) {
      throw (throwCustomError(e));
    }
  }
}
