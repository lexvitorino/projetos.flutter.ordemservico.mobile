import 'package:dio/dio.dart';
import 'package:osmobile/app/shared/repositories/interfaces/client-http.interface.dart';

class ClientHttpRepository implements IClientHttp {
  Dio dio;

  ClientHttpRepository() {
    if (dio == null) {
      BaseOptions options = new BaseOptions(
        baseUrl: 'http://10.0.2.2:3334',
        connectTimeout: 60 * 1000,
        receiveTimeout: 60 * 1000,
      );
      dio = new Dio(options);
    }
  }

  @override
  Future get(String url) async {
    try {
      var response = await dio.get(url);
      return response.data;
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        print(e);
        return null;
      } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
        print(e);
        return null;
      } else {
        print(e);
        return null;
      }
    }
  }

  @override
  Future post(String url, dynamic data) async {
    try {
      var response = await dio.post(url, data: data);
      return response.data;
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        print(e);
      } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
        print(e);
      } else {
        print(e);
      }
    }
  }

  @override
  Future put(String url, dynamic data) async {
    try {
      var response = await dio.put(url, data: data);
      return response.data;
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        print(e);
      } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
        print(e);
      } else {
        print(e);
      }
    }
  }

  @override
  Future delete(String url, dynamic data) async {
    try {
      var response = await dio.delete(url, data: data);
      return response.data;
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        print(e);
      } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
        print(e);
      } else {
        print(e);
      }
    }
  }
}
