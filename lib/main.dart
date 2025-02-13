import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'core/di/di.dart';
import 'core/utils/init_hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  await configureDependencies();
  runApp(const ProviderScope(child: App()));
}


