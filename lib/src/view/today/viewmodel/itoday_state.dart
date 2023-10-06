import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/init/cache/hive_manager.dart';
import 'package:h2o_flutter/src/core/init/cache/locator.dart';
import 'package:h2o_flutter/src/view/today/view/today_view.dart';

mixin ITodayState on ConsumerState<TodayView> {
  final dataBox = getIt.get<IHiveManager>();

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    final nextMidnight = DateTime(now.year, now.month, now.day + 1);
    final timeUntilMidnight = nextMidnight.difference(now);
    Timer(timeUntilMidnight, () {
      resetWaterIntake();
    });
  }

  void resetWaterIntake() {
    setState(() {
      dataBox.user.put('updatingWaterNeed', 0);
    });
  }
}
