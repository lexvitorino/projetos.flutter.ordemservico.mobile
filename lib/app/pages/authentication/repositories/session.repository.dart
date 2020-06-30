import 'package:flutter_modular/flutter_modular.dart';
import 'package:osmobile/app/pages/authentication/models/session.model.dart';
import 'package:osmobile/app/pages/authentication/repositories/interfaces/session.interface.dart';
import 'package:osmobile/app/shared/repositories/client-http.repository.dart';
import 'package:osmobile/app/shared/repositories/interfaces/client-http.interface.dart';
import 'package:osmobile/app/shared/services/interfaces/local-storage.interface.dart';
import 'package:osmobile/app/shared/services/shared-local-storage.service.dart';

class SessionRepository implements ISession {
  final IClientHttp clientHttp = Modular.get<ClientHttpRepository>();
  final ILocalStorage storage = Modular.get<SharedLocalStorageService>();

  @override
  Future logIn(String email, String password) async {
    var json = await clientHttp
        .post("/sessions", {"email": email, "password": password});
    final sessionModel = SessionModel.fromJson(json);
    if (sessionModel != null && sessionModel.token != "") {
      await storage.put("token", sessionModel.token);
    }
    return sessionModel;
  }

  @override
  Future logOut() async {
    await storage.delete("token");
  }
}
