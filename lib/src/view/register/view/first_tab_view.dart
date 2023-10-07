import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Column(
              children: [
                SizedBox(
                  height: 18,
                ),
                CustomPercentIndicator(percent: 0.2),
                SizedBox(
                  height: 38,
                ),
              ],
            ),
            Text(
              textAlign: TextAlign.center,
              "kFirstWhatsYourGender".tr(),
              style: currentTheme.textTheme.bodySmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 38,
            ),
            BasicNoteContainer(
                imagePath: 'assets/images/glass_water.svg',
                text: "kFirstWhatsYourGenderHelp".tr()),
            const SizedBox(
              height: 188,
            ),
            SizedBox(
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
            )
          ],
        ),
      ),
    );
  }
}
