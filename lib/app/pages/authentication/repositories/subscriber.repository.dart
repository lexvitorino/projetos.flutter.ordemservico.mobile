import 'package:flutter_modular/flutter_modular.dart';
import 'package:osmobile/app/pages/authentication/models/subscriber.model.dart';
import 'package:osmobile/app/pages/authentication/repositories/interfaces/subscriber.interface.dart';
import 'package:osmobile/app/shared/repositories/client-http.repository.dart';
import 'package:osmobile/app/shared/repositories/interfaces/client-http.interface.dart';

class SubscriberRepository implements ISubscriber {
  final IClientHttp clientHttp = Modular.get<ClientHttpRepository>();

  @override
  Future subscribers(
      String name, String email, String password, String repassword) async {
    try {
      var json = await clientHttp.post("/subscribers", {
        "name": name.trim(),
        "email": email.trim(),
        "password": password.trim(),
        "repassword": repassword.trim(),
      });
      final subscriberModel = SubscriberModel.fromJson(json);
      return subscriberModel;
    } catch (e) {
      throw (e);
    }
  }
}
