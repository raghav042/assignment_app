import 'package:assignment_app/core/error_handling/app_error.dart';
import 'package:assignment_app/core/navigation/routes.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/user.dart';
import '../../presentation/screens/home/user_list_screen.dart';
import '../../presentation/screens/user_details/user_detail_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.userList: return MaterialPageRoute(builder: (_) => const UserListScreen());
      case Routes.userDetail:
        if (settings.arguments is User) {
          final user = settings.arguments as User;
          return MaterialPageRoute(builder: (_) => UserDetailScreen(user: user));
        } else {
          throw const AppError("Please provide User for UserDetailScreen");
        }
      default:
        return MaterialPageRoute(builder: (_) => const UserListScreen());
    }
  }
}
