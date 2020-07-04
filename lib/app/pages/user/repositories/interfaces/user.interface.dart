import 'package:osmobile/app/pages/user/user.model.dart';

abstract class IUser {
  Future<List<UserModel>> get();
  Future<UserModel> getById(String id);
  Future create(dynamic data);
  Future update(dynamic data);
  Future delete(dynamic data);
}
