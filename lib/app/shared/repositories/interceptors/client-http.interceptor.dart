import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osmobile/app/pages/authentication/models/session.model.dart';
import 'package:osmobile/app/pages/authentication/repositories/interfaces/session.interface.dart';

import '../../constants.dart';

class HttpClientInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    // Set TOKEN armazenado no SharedPreferences
    final SessionModel sessionModel = await Modular.get<ISession>().getToken();
    if (sessionModel != null) {
      options.headers = {'Authorization': "Bearer " + sessionModel.token};
    }

    // Print console debug
    if (DEV) {
      print(
        "REQUEST[${options.method}] => PATH: ${options.path}",
      );
      print(
        "REQUEST[headers] => PATH: ${options.headers}",
      );
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
