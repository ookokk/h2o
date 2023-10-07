import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/init/cache/hive_manager.dart';
import 'package:h2o_flutter/src/core/init/cache/init_locator.dart';

class WaterIntakeViewModel extends ChangeNotifier {
  final IHiveManager dataBox;

  WaterIntakeViewModel(this.dataBox);

  double get dailyWaterNeed => fetchDailyWaterNeed();

  void increaseWaterIntakeBy300Ml() {
    final currentWaterNeed = fetchDailyWaterNeed();
    final newWaterNeed = currentWaterNeed - 300;

    if (newWaterNeed >= 0) {
      dataBox.user.put('updatingWaterNeed', newWaterNeed);
      notifyListeners();
    }
  }

  void decreaseWaterIntakeBy300Ml() {
    final currentWaterNeed = fetchDailyWaterNeed();
    final newWaterNeed = currentWaterNeed + 300;

    if (newWaterNeed >= 0) {
      dataBox.user.put('updatingWaterNeed', newWaterNeed);
      notifyListeners();
    }
  }

  double fetchDailyWaterNeed() {
    final dailyWaterNeed = dataBox.user.get('updatingWaterNeed') ?? 0.0;
    return dailyWaterNeed.toDouble();
  }
}

final waterIntakeProvider = ChangeNotifierProvider<WaterIntakeViewModel>((ref) {
  final dataBox = getIt.get<IHiveManager>();
  return WaterIntakeViewModel(dataBox);
});
