import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:h2o_flutter/firebase_options.dart';
import 'package:h2o_flutter/src/core/init/cache/hive_manager.dart';
import 'package:h2o_flutter/src/core/init/cache/shared_manager.dart';

final GetIt getIt = GetIt.instance;

Future<void> initLocator() async {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerSingletonAsync<IHiveManager>(() async => HiveManager().init());
  getIt.registerSingletonAsync<ISharedPreferencesManager>(
      () async => SharedPreferencesManager().init());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await Alarm.init(showDebugLogs: true);
  await getIt.allReady();
}
