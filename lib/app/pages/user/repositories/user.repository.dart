import 'package:flutter_modular/flutter_modular.dart';
import 'package:osmobile/app/pages/user/repositories/interfaces/user.interface.dart';
import 'package:osmobile/app/pages/user/user.model.dart';
import 'package:osmobile/app/shared/models/avatar.model.dart';
import 'package:osmobile/app/shared/repositories/client-http.repository.dart';
import 'package:osmobile/app/shared/repositories/interfaces/client-http.interface.dart';

class UserRepository implements IUser {
  final IClientHttp clientHttp = Modular.get<ClientHttpRepository>();

  @override
  Future<List<UserModel>> get() async {
    try {
      var response = await clientHttp.get("/users");
      return List.generate(
        response.length,
        (i) {
          return UserModel(
            id: response[i]['id'],
            subscriberId: response[i]['subscriber_id'],
            name: response[i]['name'],
            email: response[i]['email'],
            avatarId: response[i]['avatar_id'],
            permission: response[i]['permission'],
            avatar: response[i]['avatar'] != null
                ? new Avatar.fromJson(response[i]['avatar'])
                : null,
          );
        },
      );
    } catch (e) {
      throw (e);
    }
  }

  @override
  Future<UserModel> getById(String id) async {
    try {
      var response = await clientHttp.get("/users/" + id.toString());
      return UserModel.fromJson(response);
    } catch (e) {
      throw (e);
    }
  }

  @override
  Future create(dynamic data) async {
    try {
      var response = await clientHttp.post("/users", data.toJson());
      return UserModel.fromJson(response);
    } catch (e) {
      throw (e);
    }
  }

  @override
  Future update(dynamic data) async {
    try {
      var response = await clientHttp.put("/users", data.toMap());
      return UserModel.fromJson(response);
    } catch (e) {
      throw (e);
    }
  }

  @override
  Future delete(dynamic data) async {
    try {
      var response = await clientHttp.delete("/users", data.toJson());
      return UserModel.fromJson(response);
    } catch (e) {
      throw (e);
    }
  }
}
