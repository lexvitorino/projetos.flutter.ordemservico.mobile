import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osmobile/app/pages/authentication/repositories/interfaces/session.interface.dart';

import '../../constants.dart';

class HttpClientInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    // Print console debug
    if (DEV) {
      print(
        "REQUEST[${options.method}] => PATH: ${options.path}",
      );
    }

    // Set TOKEN armazenado no SharedPreferences
    final token = await Modular.get<ISession>().getToken();
    if (token != null) {
      options.headers = {'Authorization': token};
    }
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    // Print console debug
    if (DEV) {
      print(
        "RESPONSE[${response.statusCode}] => PATH: ${response.request.path}",
      );
    }

    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    // Print console debug
    if (DEV) {
      print(
        "ERROR[${err.response.statusCode}] => PATH: ${err.request.path}",
      );
    }

    return super.onError(err);
  }
}
