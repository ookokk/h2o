import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:h2o_flutter/src/core/const/device_size.dart';
import 'package:h2o_flutter/src/core/const/strings.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:h2o_flutter/src/view/register/widget/basic_note_container.dart';
import 'package:h2o_flutter/src/view/register/widget/custom_percent_indicator.dart';
import 'package:h2o_flutter/src/view/register/widget/custom_switch.dart';

class FirstTabView extends ConsumerWidget {
  const FirstTabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
      child: SizedBox(
        height: DeviceSize.kHeight(context),
        child: Column(
          children: [
            const Expanded(
                child: Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                CustomPercentIndicator(percent: 0.2),
                SizedBox(
                  height: 24,
                ),
              ],
            )),
            Expanded(
              child: Text(
                textAlign: TextAlign.center,
                Strings.kFirstWhatsYourGender,
                style: currentTheme.textTheme.bodySmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const Expanded(
              flex: 2,
              child: BasicNoteContainer(
                  imagePath: 'assets/images/glass_water.svg',
                  text: Strings.kFirstWhatsYourGenderHelp),
            ),
            Expanded(
                flex: 6,
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/female.svg',
                        height: 85,
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      const CustomSwitch(),
                      const SizedBox(
                        width: 18,
                      ),
                      SvgPicture.asset(
                        'assets/images/male.svg',
                        height: 85,
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
