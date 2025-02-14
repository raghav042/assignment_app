import 'package:flutter/material.dart';

import 'core/navigation/app_routes.dart';
import 'core/navigation/routes.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: Routes.userList,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
