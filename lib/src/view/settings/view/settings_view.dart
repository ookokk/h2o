import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/const/device_size.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:h2o_flutter/src/view/settings/viewmodel/isettings_state.dart';
import 'package:h2o_flutter/src/view/settings/widget/edit_personal_info_show_dialog.dart';
import 'package:h2o_flutter/src/view/settings/widget/theme_switch.dart';
import 'package:h2o_flutter/src/view/settings/widget/language_bottom_sheet.dart';
import 'package:h2o_flutter/src/view/settings/widget/settings_category_row.dart';
import 'package:h2o_flutter/src/view/settings/widget/settings_list_tile.dart';
import 'package:lottie/lottie.dart';

class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ProfileSettingsViewState();
}

class _ProfileSettingsViewState extends ConsumerState<SettingsView>
    with ISettingsState {
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
        child: Scaffold(
            backgroundColor: currentTheme.scaffoldBackgroundColor,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: DeviceSize.kHeight(context) * 0.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'assets/animations/settings.json',
                          animate: true,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    height: DeviceSize.kHeight(context) * 0.7,
                    child: ListView(children: [
                      SettingsCategoryRow(
                          headerText: "kSettingsPersonal".tr(),
                          iconData: Icons.account_circle),
                      SettingsListTile(
                          text: "kSettingsGender".tr(),
                          trailingChild: Text(
                            getPersonalInformation(1),
                            style: currentTheme.textTheme.headlineLarge,
                          )),
                      SettingsListTile(
                          text: "kSettingsWeight".tr(),
                          trailingChild: Text(
                            getPersonalInformation(2),
                            style: currentTheme.textTheme.headlineLarge,
                          )),
                      SettingsListTile(
                          text: "kSettingsExerciseFrequency".tr(),
                          trailingChild: Text(
                            getPersonalInformation(3),
                            style: currentTheme.textTheme.headlineLarge,
                          )),
                      SettingsListTile(
                          text: "kSettingsWakeUpTime".tr(),
                          trailingChild: Text(
                            '${getPersonalInformation(4)} : ${getPersonalInformation(5)}',
                            style: currentTheme.textTheme.headlineLarge,
                          )),
                      SettingsListTile(
                          text: "kSettingsBedTime".tr(),
                          trailingChild: Text(
                            '${getPersonalInformation(6)} : ${getPersonalInformation(7)}',
                            style: currentTheme.textTheme.headlineLarge,
                          )),
                      SettingsListTile(
                          onTap: () {
                            editPersonalInfoShowDialog(context, ref);
                          },
                          text: "kSettingsEditPersonal".tr(),
                          trailingChild: Icon(
                            Icons.arrow_forward_ios,
                            color: currentTheme.indicatorColor,
                          )),
                      SettingsCategoryRow(
                          headerText: "kSettingsMore".tr(),
                          iconData: Icons.dashboard_customize_outlined),
                      SettingsListTile(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return const LanguageBottomSheet();
                                });
                          },
                          text: "kSettingsLanguage".tr(),
                          trailingChild: Icon(
                            Icons.arrow_forward_ios,
                            color: currentTheme.indicatorColor,
                          )),
                      SettingsListTile(
                          text: "kSettingsDarkTheme".tr(),
                          trailingChild: const ThemeSwitch()),
                    ]),
                  ),
                ],
              ),
            )));
  }
}
