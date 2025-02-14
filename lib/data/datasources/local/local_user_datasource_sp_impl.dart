import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entities/user.dart';
import '../../models/user_model.dart';
import 'local_user_datasource.dart';

class LocalUserDataSourceSPImpl implements LocalUserDataSource {
  static late final SharedPreferences _preferences;
  static const String _usersKey = "usersKey";

   @override
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    print("shared prefeerences initialized");
  }

  @override
  Future<void> saveAllUsers(List<UserModel> users) async {
    List<String> userString = users.map((e) => jsonEncode(e.toJson())).toList();
    print("saving users => $userString");
    await _preferences.setStringList(_usersKey, userString);
  }

  @override
  List<UserModel> getAllUsers() {
    List<String> userString = _preferences.getStringList(_usersKey) ?? [];
    print("getting users => $userString");
    return userString.map((e) => UserModel.fromJson(jsonDecode(e))).toList();
  }
}
