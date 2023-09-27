import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:h2o_flutter/src/core/init/cache/cache_manager.dart';
import 'package:h2o_flutter/src/product/model/user.dart';

void main() {
  // CacheManager'ı başlat
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await CacheManager.instance.init();
  });

  test('Kullanıcıyı Kaydet ve Al', () async {
    final user = User(
      gender: 'male',
      weight: 70.5,
      wakeUpTime: const TimeOfDay(hour: 7, minute: 30),
      bedTime: const TimeOfDay(hour: 23, minute: 0),
      id: 1,
      dailyWaterNeed: 2000.0,
    );

    await CacheManager.instance.saveUser(user);

    final cachedUser = CacheManager.instance.getUser();

    expect(cachedUser, isNotNull);
    expect(cachedUser!.gender, user.gender);
    expect(cachedUser.weight, user.weight);
    expect(cachedUser.wakeUpTime, user.wakeUpTime);
    expect(cachedUser.bedTime, user.bedTime);
    expect(cachedUser.id, user.id);
    expect(cachedUser.dailyWaterNeed, user.dailyWaterNeed);

    await CacheManager.instance.deleteUser();

    final deletedUser = CacheManager.instance.getUser();
    expect(deletedUser, isNull);
  });
}
