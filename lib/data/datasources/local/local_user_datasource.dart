import 'package:assignment_app/data/models/user_model.dart';

import '../../../domain/entities/user.dart';

abstract class LocalUserDataSource {
  Future<void> init();
  List<UserModel> getAllUsers();
  Future<void> saveAllUsers(List<UserModel> users);
}
