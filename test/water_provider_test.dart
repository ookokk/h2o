import 'package:flutter_test/flutter_test.dart';
import 'package:h2o_flutter/src/core/init/cache/hive_manager.dart';
import 'package:h2o_flutter/src/view/today/viewmodel/water_intake_viewmodel.dart';

void main() {
  final hiveManager = HiveManager();

  group('WaterIntakeViewModel Tests', () {
    final viewModel = WaterIntakeViewModel(hiveManager);

    test('Daily water need is retrieved correctly', () {
      hiveManager.user.put('dailyWaterNeed', 2000);

      final dailyWaterNeed = viewModel.dailyWaterNeed;

      expect(dailyWaterNeed, 2000);
    });

    test('Decreasing water intake works correctly', () {
      hiveManager.user.put('dailyWaterNeed', 2000);

      viewModel.decreaseWaterIntakeBy300Ml();

      expect(hiveManager.user.get('dailyWaterNeed'), 1700);
    });

    test('_fetchDailyWaterNeed method works correctly', () {
      hiveManager.user.put('dailyWaterNeed', 1500);

      final dailyWaterNeed = viewModel.fetchDailyWaterNeed();

      expect(dailyWaterNeed, 1500);
    });
  });
}
