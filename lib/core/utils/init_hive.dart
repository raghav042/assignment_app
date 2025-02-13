import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/entities/user.dart';

Future<void> initHive() async {
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive
    ..init(appDocumentDir.path)
    ..registerAdapter(UserAdapter());
}
