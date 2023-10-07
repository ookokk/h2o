import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/init/lang/language_manager.dart';
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
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    return Scaffold(
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(child: WaterCircularIndicator()),
            const SizedBox(
              height: 18,
            ),
            const SizedBox(
              height: 450,
              child: HistoryListView(),
            ),
            TextButton(
                onPressed: () {
                  context.setLocale(const Locale('ja', 'JP'));

                  print(LanguageManager.instance.currentLocale);
                },
                child: const Text('lksadj'))
          ],
        ),
      ),
    );
  }
}
