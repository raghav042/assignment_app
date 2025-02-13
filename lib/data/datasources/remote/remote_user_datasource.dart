import '../../../domain/entities/user.dart';

abstract class RemoteUserDataSource {
  Future<List<User>> getUsers(int page, int itemCount);
}
