import 'package:flutter/material.dart';

import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';
import 'presentation/screens/home/user_list_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const UserListScreen(),
    );
  }
}
