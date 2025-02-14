import 'package:assignment_app/core/constant/app_strings.dart';
import 'package:dio/dio.dart';

import '../../../../core/networking/api_client.dart';
import '../../../core/constant/api_endpoints.dart';
import '../../../core/error_handling/app_error.dart';
import '../../../domain/entities/user.dart';
import '../../models/user_model.dart';
import '../local/local_user_datasource.dart';
import 'remote_user_datasource.dart';

class RemoteUserDataSourceImpl implements RemoteUserDataSource {
  const RemoteUserDataSourceImpl(this._apiClient, this._localDataSource);
  final ApiClient _apiClient;
  final LocalUserDataSource _localDataSource;

  @override
  Future<List<User>> getUsers(int page, int itemCount) async {
    try {
      final response = await _apiClient.get(
        ApiEndpoints.users,
        queryParameters: {'page': page, 'per_page': itemCount},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];

        final users = data
            .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
            .toList();
        await _localDataSource.saveAllUsers(users);
        return users;
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
    } on DioException catch (e) {
      // return users from cache
      final cachedUsers = _localDataSource.getAllUsers();
      if (cachedUsers.isNotEmpty) cachedUsers;

      throw AppError(
        e.message ?? AppStrings.anErrorOccurred,
        details: e.response.toString(),
      );
    }
  }
}
