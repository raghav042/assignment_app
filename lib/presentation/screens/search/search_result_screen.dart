import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/user_list_provider.dart';
import '../home/user_tile.dart';

class SearchResultScreen extends ConsumerWidget {
  const SearchResultScreen({super.key, required this.query});
  final String query;

  @override
  Widget build(BuildContext context, ref) {
    final q = query.replaceAll(" ", "").toLowerCase();

    final users = ref
        .watch(userListProvider)
        .users
        .where((user) =>
            user.email.contains(q) ||
            user.firstName.contains(q) ||
            user.lastName.contains(q))
        .toList();

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (_, i) {
        return UserTile(user: users[i]);
      },
    );
  }
}
