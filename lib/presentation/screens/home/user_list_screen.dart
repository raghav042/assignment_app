import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constant/app_strings.dart';
import '../../providers/user_list_provider.dart';
import '../../../core/error_handling/app_error.dart';
import '../../providers/user_list_state.dart';
import '../../widgets/app_error_widget.dart';
import '../search/search_deligate.dart';
import 'user_tile.dart';

class UserListScreen extends ConsumerStatefulWidget {
  const UserListScreen({super.key});

  @override
  ConsumerState<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends ConsumerState<UserListScreen> {
  final ScrollController scrollController = ScrollController();

  void _handleScroll() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        ref.read(userListProvider.notifier).fetchUsers();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((t) {
      ref.read(userListProvider.notifier).fetchUsers();
      _handleScroll();
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userListState = ref.watch(userListProvider);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.users),
          actions: [
            IconButton(
              onPressed: () async {
                await showSearch(
                  context: context,
                  delegate: AppSearchDelegate(),
                );
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () {
            return ref
                .read(userListProvider.notifier)
                .fetchUsers(refresh: true);
          },
          child: buildBody(userListState),
        ),
        bottomNavigationBar: userListState.error != null
            ? AppErrorWidget(
                AppError(userListState.error ?? AppStrings.somethingWentWrong),
                onRetry: () {
                  ref.read(userListProvider.notifier).fetchUsers(refresh: true);
                },
              )
            : null,
      ),
    );
  }

  Widget buildBody(UserListState userListState) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            controller: scrollController,
            itemCount: userListState.users.length,
            physics: const AlwaysScrollableScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemBuilder: (_, i) => UserTile(user: userListState.users[i]),
          ),
        ),
        if (userListState.isLoading && userListState.users.isNotEmpty)
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}
