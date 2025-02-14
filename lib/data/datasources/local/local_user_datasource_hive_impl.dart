import 'package:hive_ce/hive.dart';

import '../../../core/constant/app_constant.dart';
import '../../../domain/entities/user.dart';
import 'local_user_datasource.dart';

class LocalUserDataSourceHiveImpl implements LocalUserDataSource {
  static const String userKey = "users";
  static final userBox = Hive.box(AppConstant.userBox);

  @override
  List<User> getAllUsers() {
    return userBox.get(userKey)?.cast<User>() ?? [];
  }

  @override
  Future<void> saveAllUsers(List<User> users) async {
    await userBox.put(userKey, users);
  }
}
