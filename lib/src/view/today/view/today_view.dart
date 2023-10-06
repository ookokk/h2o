import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/init/cache/hive_manager.dart';
import 'package:h2o_flutter/src/core/init/cache/locator.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:h2o_flutter/src/view/today/viewmodel/itoday_state.dart';
import 'package:h2o_flutter/src/view/today/widget/history_list_view.dart';
import 'package:h2o_flutter/src/view/today/widget/water_circular_indicator.dart';

class TodayView extends ConsumerStatefulWidget {
  const TodayView({Key? key}) : super(key: key);
  @override
  TodayViewState createState() => TodayViewState();
}

class TodayViewState extends ConsumerState<TodayView> with ITodayState {
  final dataBox = getIt.get<IHiveManager>();

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    return Scaffold(
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            WaterCircularIndicator(),
            SizedBox(
              height: 18,
            ),
            SizedBox(
              height: 750,
              child: HistoryListView(),
            )
          ],
        ),
      ),
    );
  }
}
