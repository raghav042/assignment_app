import '../../models/user_model.dart';

abstract class LocalUserDataSource {
  Future<List<UserModel>?> getCachedUsers(int page, int perPage);
  Future<void> cacheUsers(List<UserModel> users, int page, int perPage);
}
