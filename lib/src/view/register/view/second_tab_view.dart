import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/const/strings.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:h2o_flutter/src/view/register/widget/basic_note_container.dart';
import 'package:h2o_flutter/src/view/register/widget/custom_percent_indicator.dart';
import 'package:h2o_flutter/src/view/register/widget/weight_picker.dart';

class SecondTabView extends ConsumerWidget {
  const SecondTabView({
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
            const CustomPercentIndicator(percent: 0.4),
            const SizedBox(
              height: 38,
            ),
            Text(
              textAlign: TextAlign.center,
              Strings.kSecondHowMuchWeigh,
              style: currentTheme.textTheme.bodySmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 38,
            ),
            const BasicNoteContainer(
                imagePath: 'assets/images/weight_tarti.svg',
                text: Strings.kSecondYourBody),
            const SizedBox(
              height: 28,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [WeightPicker()],
            ),
          ],
        ),
      ),
    );
  }
}
