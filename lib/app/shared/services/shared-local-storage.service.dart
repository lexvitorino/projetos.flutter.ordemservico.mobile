import 'dart:async';

import 'package:osmobile/app/shared/services/interfaces/local-storage.interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLocalStorageService implements ILocalStorage {
  @override
  Future get(String key) async {
    var shared = await SharedPreferences.getInstance();
    return shared.get(key);
  }

  @override
  Future delete(String key) async {
    var shared = await SharedPreferences.getInstance();
    return shared.remove(key);
  }

  @override
  Future<bool> put(String key, dynamic value) async {
    var shared = await SharedPreferences.getInstance();
    if (value is bool) {
      return shared.setBool(key, value);
    } else if (value is String) {
      return shared.setString(key, value);
    } else if (value is int) {
      return shared.setInt(key, value);
    } else if (value is double) {
      return shared.setDouble(key, value);
    } else {
      return false;
    }
  }
}
