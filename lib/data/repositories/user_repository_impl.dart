import '../../domain/entities/user.dart';
import '../datasources/remote/remote_user_datasource.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl(this._remoteDataSource);
  final RemoteUserDataSource _remoteDataSource;

  @override
  Future<List<User>> getUsers(int page, int perPage) {
    return _remoteDataSource.getUsers(page, perPage);
  }
}
