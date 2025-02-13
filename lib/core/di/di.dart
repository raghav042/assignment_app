import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../networking/api_client.dart';
import '../../data/datasources/local/local_user_datasource.dart';
import '../../data/datasources/local/local_user_datasource_impl.dart';
import '../../data/datasources/remote/remote_user_datasource.dart';
import '../../data/datasources/remote/remote_user_datasource_impl.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/usecases/get_users_usecase.dart';
import '../../presentation/providers/user_list_provider.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // Dio Client
  getIt.registerLazySingleton<Dio>(() => ApiClient.createDio());
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(getIt<Dio>()));

  // Data sources
  getIt.registerLazySingleton<RemoteUserDataSource>(() => RemoteUserDataSourceImpl(getIt<ApiClient>(), getIt<LocalUserDataSource>()));
  getIt.registerLazySingleton<LocalUserDataSource>(() => LocalUserDataSourceImpl());

  // Repositories
  getIt.registerLazySingleton<UserRepositoryImpl>(() => UserRepositoryImpl(getIt<RemoteUserDataSource>()));

  // Use cases
  getIt.registerLazySingleton(() => GetUsersUseCase(getIt<UserRepositoryImpl>()));

  // Providers
  getIt.registerFactory(() => UserListProvider(getIt<GetUsersUseCase>()));
}
