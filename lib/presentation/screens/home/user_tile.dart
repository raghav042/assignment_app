import 'package:assignment_app/core/extensions/string_extensions.dart';
import 'package:assignment_app/core/navigation/routes.dart';
import 'package:assignment_app/domain/entities/user.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(Routes.userDetail, arguments: user);
      },
      leading: Hero(
        tag: "profile_pic${user.id}",
        child: CircleAvatar(
          backgroundImage: NetworkImage(user.imageUrl),
        ),
      ),
      title: Text(
          "${user.firstName.capitalizeFirst} ${user.lastName.capitalizeFirst}"),
      subtitle: Text(user.email),
    );
  }
}
