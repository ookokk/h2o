import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/const/device_size.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:h2o_flutter/src/view/register/widget/basic_note_container.dart';
import 'package:h2o_flutter/src/view/register/widget/custom_percent_indicator.dart';
import 'package:h2o_flutter/src/view/register/widget/exercise_container.dart';

class ThirdTabView extends ConsumerWidget {
  const ThirdTabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 18,
            ),
            const CustomPercentIndicator(percent: 0.6),
            const SizedBox(
              height: 38,
            ),
            Text(
              textAlign: TextAlign.center,
              "kThirdHowOftenExercise".tr(),
              style: currentTheme.textTheme.bodySmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 38,
            ),
            BasicNoteContainer(
                imagePath: 'assets/images/dumbell.svg',
                text: "kThirdPeopleWho".tr()),
            const SizedBox(
              height: 38,
            ),
            SizedBox(
              height: DeviceSize.kHeight(context) * 0.8,
              child: Column(
                children: [
                  ExerciseContainer(
                    index: 0,
                    key: UniqueKey(),
                    imagePath: "assets/images/rare.svg",
                    title: "kThirdRarely".tr(),
                    subTitle: "kThirdFew".tr(),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  ExerciseContainer(
                    index: 1,
                    key: UniqueKey(),
                    imagePath: "assets/images/often.svg",
                    title: "kThirdJustSometimes".tr(),
                    subTitle: "kThird2_3".tr(),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  ExerciseContainer(
                    index: 2,
                    key: UniqueKey(),
                    imagePath: "assets/images/hard.svg",
                    title: "kThirdItsPart".tr(),
                    subTitle: "kThirdOver".tr(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
