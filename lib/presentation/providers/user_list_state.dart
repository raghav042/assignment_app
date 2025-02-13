import '../../domain/entities/user.dart';

class UserListState {
  const UserListState({
    this.users = const [],
    this.page = 1,
    this.isLoading = false,
    this.isEnd = false,
    this.error,
  });

  final List<User> users;
  final int page;
  final bool isLoading;
  final bool isEnd;
  final String? error;

  UserListState copyWith({
    List<User>? users,
    int? page,
    bool? isLoading,
    bool? isEnd,
    String? error,
  }) {
    return UserListState(
      users: users ?? this.users,
      page: page ?? this.page,
      isLoading: isLoading ?? this.isLoading,
      isEnd: isEnd ?? this.isEnd,
      error: error,
    );
  }
}
