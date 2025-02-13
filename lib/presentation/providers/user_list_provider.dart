import 'package:assignment_app/core/constant/app_constant.dart';
import 'package:assignment_app/core/constant/app_strings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/di/di.dart';
import '../../core/error_handling/app_error.dart';
import '../../domain/usecases/get_users_usecase.dart';
import 'user_list_state.dart';

class UserListProvider extends StateNotifier<UserListState> {
  UserListProvider(this._getUsersUseCase) : super(const UserListState());
  final GetUsersUseCase _getUsersUseCase;

  /// Make [refresh] true to reset state and load initial users
  Future<void> fetchUsers({bool refresh = false}) async {
    if (state.isLoading || state.isEnd && !refresh) return;

    /// Start loading and clear error
    state = state.copyWith(isLoading: true, error: null);

    final nextPage = refresh ? 1 : state.page;

    try {
      /// Fetch data from api
      final newUsers = await _getUsersUseCase.execute(
        nextPage,
        AppConstant.fetchCount,
      );

      /// Replace list on refresh
      if (refresh) {
        state = UserListState(
          users: newUsers,
          page: nextPage + 1,
          isEnd: newUsers.length < AppConstant.fetchCount,
          isLoading: false,
        );
      } else {
        state = state.copyWith(
          users: [...state.users, ...newUsers],
          page: nextPage + 1,
          isEnd: newUsers.length < AppConstant.fetchCount,
          isLoading: false,
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: AppStrings.somethingWentWrong,
      );
      throw AppError(e.toString());
    }
  }
}

final userListProvider = StateNotifierProvider<UserListProvider, UserListState>(
  (ref) => UserListProvider(getIt<GetUsersUseCase>()),
);
