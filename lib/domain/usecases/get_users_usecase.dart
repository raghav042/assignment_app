import '../../data/repositories/user_repository_impl.dart';
import '../entities/user.dart';

class GetUsersUseCase {
  const GetUsersUseCase(this._userRepository);
  final UserRepositoryImpl _userRepository;

  Future<List<User>> execute(int page, int perPage) async {
    return await _userRepository.getUsers(page, perPage);
  }
}
