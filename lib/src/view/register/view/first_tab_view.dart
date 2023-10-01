import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:h2o_flutter/src/core/const/device_size.dart';
import 'package:h2o_flutter/src/core/const/strings.dart';
import 'package:h2o_flutter/src/core/init/cache/hive_manager.dart';
import 'package:h2o_flutter/src/core/init/cache/locator.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:h2o_flutter/src/product/widget/custom_app_bar.dart';
import 'package:h2o_flutter/src/view/get_started/widget/get_started_button.dart';
import 'package:h2o_flutter/src/view/register/view_model/first_tab_view_model.dart';
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
    final isChecked = ref.watch(isCheckedProvider);
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
              const CustomPercentIndicator(percent: 0.2),
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
                        // Navigator.pushNamed(context, '/second');
                        final dataBox = getIt.get<IHiveManager>();
                        final newGender = isChecked ? 'Male' : 'Female';
                        dataBox.user.put('gender', newGender);
                        print("tusa bastin");
                        print(dataBox.user.get('gender'));
                        print(newGender);
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
