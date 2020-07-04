import 'package:flutter_modular/flutter_modular.dart';
import 'package:osmobile/app/pages/authentication/models/session.model.dart';
import 'package:osmobile/app/pages/authentication/repositories/interfaces/session.interface.dart';
import 'package:osmobile/app/shared/constants.dart';
import 'package:osmobile/app/shared/repositories/client-http.repository.dart';
import 'package:osmobile/app/shared/repositories/interfaces/client-http.interface.dart';
import 'package:osmobile/app/shared/services/interfaces/local-storage.interface.dart';
import 'package:osmobile/app/shared/services/jwt-decode.service.dart';
import 'package:osmobile/app/shared/services/shared-local-storage.service.dart';

class SessionRepository implements ISession {
  final IClientHttp clientHttp = Modular.get<ClientHttpRepository>();
  final ILocalStorage storage = Modular.get<SharedLocalStorageService>();

  @override
  Future logIn(String email, String password) async {
    try {
      var json = await clientHttp.post("/sessions", {
        "email": email.trim(),
        "password": password.trim(),
      });
      final sessionModel = SessionModel.fromJson(json);
      if (sessionModel != null && sessionModel.token != "") {
        final parseToken = SessionModel.fromJson(
            JwtDecode.parseJwtPayLoad(sessionModel.token));
        parseToken.token = sessionModel.token;
        await storage.put("token", sessionModel.token);
      }
      return sessionModel;
    } catch (e) {
      throw (e);
    }
  }

  @override
  Future resetPassword(String email) async {
    try {
      var json = await clientHttp.post("/lock", {
        "email": email.trim(),
        "unlock": true,
      });
      final sessionModel = SessionModel.fromJson(json);
      return sessionModel;
    } catch (e) {
      throw (e);
    }
  }

  @override
  Future changePassword(String email, String password, String newpassword,
      String repassword) async {
    try {
      var json = await clientHttp.post("/unlock", {
        "email": email.trim(),
        "password": password.trim(),
        "newpassword": newpassword.trim(),
        "repassword": repassword.trim(),
        "unlock": true
      });
      final sessionModel = SessionModel.fromJson(json);
      return sessionModel;
    } catch (e) {
      throw (e);
    }
  }

  @override
  Future logOut() async {
    await storage.delete(TOKEN);
  }

  @override
  Future getToken() async {
    final token = await storage.get(TOKEN);
    if (token == null) return null;
    final parseToken = SessionModel.fromJson(JwtDecode.parseJwtPayLoad(token));
    parseToken.token = token;
    return parseToken;
  }
}
