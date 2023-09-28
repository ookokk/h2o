import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:h2o_flutter/src/core/const/device_size.dart';
import 'package:h2o_flutter/src/core/const/strings.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:h2o_flutter/src/product/widget/custom_app_bar.dart';
import 'package:h2o_flutter/src/view/get_started/widget/get_started_button.dart';
import 'package:h2o_flutter/src/view/register/widget/custom_switch.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class FirstTabView extends ConsumerWidget {
  const FirstTabView({
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
            LinearPercentIndicator(
              lineHeight: 20.0,
              animationDuration: 3000,
              percent: 0.2,
              animateFromLastPercent: true,
              progressColor: Colors.blue,
              animation: false,
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              flex: 1,
              child: Text(
                textAlign: TextAlign.center,
                Strings.kFirstWhatsYourGender,
                style: currentTheme.textTheme.bodySmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                margin: const EdgeInsets.all(12),
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 0.8,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child:
                            SvgPicture.asset('assets/images/glass_water.svg')),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(Strings.kFirstWhatsYourGenderHelp,
                          style: currentTheme.textTheme.headlineMedium),
                    ),
                  ],
                )),
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
                      CustomSwitch(),
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
    ));
  }
}
