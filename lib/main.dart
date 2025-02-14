import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'core/di/di.dart';
import 'data/datasources/local/local_user_datasource.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await getIt<LocalUserDataSource>().init();
  runApp(const ProviderScope(child: App()));
}
