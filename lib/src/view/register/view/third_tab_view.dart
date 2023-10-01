import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/const/device_size.dart';
import 'package:h2o_flutter/src/core/const/strings.dart';
import 'package:h2o_flutter/src/core/init/cache/hive_manager.dart';
import 'package:h2o_flutter/src/core/init/cache/locator.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:h2o_flutter/src/product/widget/custom_app_bar.dart';
import 'package:h2o_flutter/src/view/get_started/widget/get_started_button.dart';
import 'package:h2o_flutter/src/view/register/view_model/third_tab_view_model.dart';
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
        child: Scaffold(
      appBar: CustomAppBar(
        onTap: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      body: SizedBox(
        height: DeviceSize.kHeight(context),
        child: Column(
          children: [
            const Expanded(
              child: CustomPercentIndicator(percent: 0.6),
            ),
            const Expanded(
              child: SizedBox(
                height: 14,
              ),
            ),
            Expanded(
                flex: 2,
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
                    Expanded(
                      flex: 2,
                      child: ExerciseContainer(
                        index: 0,
                        key: UniqueKey(),
                        imagePath: "assets/images/rare.svg",
                        title: Strings.kThirdRarely,
                        subTitle: Strings.kThirdFew,
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(
                        height: 14,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ExerciseContainer(
                        index: 1,
                        key: UniqueKey(),
                        imagePath: "assets/images/often.svg",
                        title: Strings.kThirdJustSometimes,
                        subTitle: Strings.kThird2_3,
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(
                        height: 14,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ExerciseContainer(
                        index: 2,
                        key: UniqueKey(),
                        imagePath: "assets/images/hard.svg",
                        title: Strings.kThirdItsPart,
                        subTitle: Strings.kThirdOver,
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(
                        height: 14,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 70,
                child: GetStartedButton(
                  text: Strings.kFirstNextBtn,
                  onTap: () {
                    //  Navigator.pushNamed(context, '/fourth');
                    final selectedContainerIndex =
                        ref.read(thirdTabViewModelProvider);
                    final selectedHardness = ThirdTabViewModel()
                        .indexToTrainingHardness(selectedContainerIndex);
                    final dataBox = getIt.get<IHiveManager>();
                    dataBox.user.put('trainingHardness', selectedHardness);
                  },
                ),
              ),
            ),
            const Expanded(
              child: SizedBox(
                height: 80,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
