import 'package:h2o_flutter/src/core/init/cache/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class IHiveManager {
  Box get user;

  Future init();
  Future<void> close();
  Future<bool> boxExists({required String boxName});
  Future<void> removeBox({required String boxName});
}

final class HiveManager implements IHiveManager {
  @override
  Box get user => _user;
  late Box _user;

  @override
  Future<HiveManager> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(UserModelAdapter());

    _user = await Hive.openBox('hiveUserBox');

    return this;
  }

  Future<void> boxInit(String boxName) async {
    await Hive.openBox(boxName);
  }

  @override
  Future<void> close() async {
    await Hive.close();
  }

  @override
  Future<bool> boxExists({required String boxName}) async {
    return await Hive.boxExists(boxName);
  }

  @override
  Future<void> removeBox({required String boxName}) async {
    await Hive.deleteBoxFromDisk(boxName);
  }
}
