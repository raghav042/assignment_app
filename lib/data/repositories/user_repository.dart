import '../../domain/entities/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers(int page, int perPage);
}
