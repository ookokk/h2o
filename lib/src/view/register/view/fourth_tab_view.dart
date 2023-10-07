import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:h2o_flutter/src/view/register/widget/basic_note_container.dart';
import 'package:h2o_flutter/src/view/register/widget/custom_percent_indicator.dart';
import 'package:h2o_flutter/src/view/register/widget/custom_wake_up_time_picker.dart';

class FourthTabView extends ConsumerWidget {
  const FourthTabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Column(
              children: [
                SizedBox(
                  height: 18,
                ),
                CustomPercentIndicator(percent: 0.8),
                SizedBox(
                  height: 38,
                ),
              ],
            ),
            Text(
              textAlign: TextAlign.center,
              "kFourthWhenWakeUp".tr(),
              style: currentTheme.textTheme.bodySmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 38,
            ),
            BasicNoteContainer(
                imagePath: 'assets/images/wake_up.svg',
                text: "kFourthGettingHydrated".tr()),
            const SizedBox(
              height: 100,
            ),
            const SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CustomWakeUpTimePicker()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
