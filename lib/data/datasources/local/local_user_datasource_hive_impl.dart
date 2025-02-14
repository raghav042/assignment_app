import 'package:assignment_app/data/models/user_model.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';

import '../../../core/constant/app_constant.dart';
import '../../../domain/entities/user.dart';
import 'local_user_datasource.dart';

class LocalUserDataSourceHiveImpl implements LocalUserDataSource {
  static const String userKey = "users";
  static final userBox = Hive.box(AppConstant.userBox);

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserAdapter());
    await Hive.openBox(AppConstant.userBox);
  }

  @override
  List<UserModel> getAllUsers() {
    return userBox.get(userKey)?.cast<User>() ?? [];
  }

  @override
  Future<void> saveAllUsers(List<UserModel> users) async {
    await userBox.put(userKey, users);
  }
}
