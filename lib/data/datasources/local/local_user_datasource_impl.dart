import 'package:assignment_app/core/constant/app_constant.dart';
import 'package:hive_ce/hive.dart';

import '../../models/user_model.dart';
import 'local_user_datasource.dart';

class LocalUserDataSourceImpl implements LocalUserDataSource {
  static const String userKey = "users";

  @override
  Future<List<UserModel>?> getCachedUsers(int page, int perPage) async {
    final userBox = await _getUserBox();
    return userBox.get(userKey);
  }

  @override
  Future<void> cacheUsers(List<UserModel> users, int page, int perPage) async {
    final userBox = await _getUserBox();
    await userBox.put(userKey, users);
  }

  /// Internal functions
  Future<Box<List<UserModel>>> _getUserBox() async {
    if (!Hive.isBoxOpen(AppConstant.userBox)) {
      return await Hive.openBox<List<UserModel>>(AppConstant.userBox);
    } else {
      return Hive.box<List<UserModel>>(AppConstant.userBox);
    }
  }
}
