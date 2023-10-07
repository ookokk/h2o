import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:h2o_flutter/src/view/register/widget/basic_note_container.dart';
import 'package:h2o_flutter/src/view/register/widget/custom_bed_time_picker.dart';
import 'package:h2o_flutter/src/view/register/widget/custom_percent_indicator.dart';

class FifthTabView extends ConsumerWidget {
  const FifthTabView({
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
                CustomPercentIndicator(percent: 1),
                SizedBox(
                  height: 38,
                ),
              ],
            ),
            Text(
              textAlign: TextAlign.center,
              "kFifthWhenEndDay".tr(),
              style: currentTheme.textTheme.bodySmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 38,
            ),
            BasicNoteContainer(
              imagePath: 'assets/images/sleep.svg',
              text: "kFifthDrinkingWater".tr(),
            ),
            const SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CustomBedTimePicker()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
