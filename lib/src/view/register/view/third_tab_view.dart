import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/const/device_size.dart';
import 'package:h2o_flutter/src/core/const/strings.dart';
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
        child: SizedBox(
          height: DeviceSize.kHeight(context),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              const CustomPercentIndicator(percent: 0.6),
              const SizedBox(
                height: 14,
              ),
              Expanded(
                  flex: 1,
                  child: Text(
                    textAlign: TextAlign.center,
                    Strings.kThirdHowOftenExercise,
                    style: currentTheme.textTheme.bodySmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  )),
              const Expanded(
                flex: 4,
                child: BasicNoteContainer(
                    imagePath: 'assets/images/dumbell.svg',
                    text: Strings.kThirdPeopleWho),
              ),
              Expanded(
                flex: 14,
                child: SizedBox(
                  height: DeviceSize.kHeight(context) * 0.45,
                  child: Column(
                    children: [
                      ExerciseContainer(
                        index: 0,
                        key: UniqueKey(),
                        imagePath: "assets/images/rare.svg",
                        title: Strings.kThirdRarely,
                        subTitle: Strings.kThirdFew,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      ExerciseContainer(
                        index: 1,
                        key: UniqueKey(),
                        imagePath: "assets/images/often.svg",
                        title: Strings.kThirdJustSometimes,
                        subTitle: Strings.kThird2_3,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      ExerciseContainer(
                        index: 2,
                        key: UniqueKey(),
                        imagePath: "assets/images/hard.svg",
                        title: Strings.kThirdItsPart,
                        subTitle: Strings.kThirdOver,
                      ),
                      const SizedBox(
                        height: 14,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
