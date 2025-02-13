import 'package:assignment_app/core/constant/app_strings.dart';
import 'package:dio/dio.dart';

import '../../../../core/networking/api_client.dart';
import '../../../../core/networking/api_endpoints.dart';
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
    /// Check for cached users first
    /// getting some issue in loading cached users
    // final cachedUsers = await _localDataSource.getCachedUsers(page, itemCount);
    // if (cachedUsers != null && cachedUsers.isNotEmpty) {
    //   return cachedUsers;
    // }
    try {
      final response = await _apiClient.get(
        ApiEndpoints.users,
        parameters: {'page': page, 'per_page': itemCount},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];

        final users = data
            .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
            .toList();
        await _localDataSource.cacheUsers(users, page, itemCount);
        return users;
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
    } on DioException catch (e) {
      // return from cache on error if available
      final cachedUsersOnError =
          await _localDataSource.getCachedUsers(page, itemCount);
      if (cachedUsersOnError != null && cachedUsersOnError.isNotEmpty) {
        return cachedUsersOnError;
      }
      throw AppError(
        e.message ?? AppStrings.anErrorOccurred,
        details: e.response.toString(),
      );
    }
  }
}
