import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/const/device_size.dart';
import 'package:h2o_flutter/src/core/const/strings.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:h2o_flutter/src/product/widget/custom_app_bar.dart';
import 'package:h2o_flutter/src/view/get_started/widget/get_started_button.dart';
import 'package:h2o_flutter/src/view/register/widget/basic_note_container.dart';
import 'package:h2o_flutter/src/view/register/widget/custom_percent_indicator.dart';
import 'package:h2o_flutter/src/view/register/widget/custom_time_picker.dart';

class FourthTabView extends ConsumerWidget {
  const FourthTabView({
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
              const SizedBox(
                height: 8,
              ),
              const CustomPercentIndicator(percent: 0.8),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  textAlign: TextAlign.center,
                  Strings.kFourthWhenWakeUp,
                  style: currentTheme.textTheme.bodySmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const Expanded(
                flex: 2,
                child: BasicNoteContainer(
                    imagePath: 'assets/images/wake_up.svg',
                    text: Strings.kFourthGettingHydrated),
              ),
              Expanded(
                  flex: 6,
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTimePicker(onTimeSelected: (selectedTime) {})
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 10,
                    child: GetStartedButton(
                      text: Strings.kFirstNextBtn,
                      onTap: () {
                        Navigator.pushNamed(context, '/second');
                      },
                    ),
                  )),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
