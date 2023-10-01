import 'package:get_it/get_it.dart';
import 'package:h2o_flutter/src/core/init/cache/hive_manager.dart';
import 'package:h2o_flutter/src/core/init/cache/shared_manager.dart';

final GetIt getIt = GetIt.instance;

Future<void> initLocator() async {
  getIt.registerSingletonAsync<IHiveManager>(() async => HiveManager().init());
  getIt.registerSingletonAsync<ISharedPreferencesManager>(
      () async => SharedPreferencesManager().init());

  await getIt.allReady();
}
