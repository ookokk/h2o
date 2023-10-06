import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/const/device_size.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:h2o_flutter/src/view/register/widget/custom_switch.dart';
import 'package:h2o_flutter/src/view/settings/widget/language_bottom_sheet.dart';
import 'package:h2o_flutter/src/view/settings/widget/settings_category_row.dart';
import 'package:h2o_flutter/src/view/settings/widget/settings_list_tile.dart';

class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ProfileSettingsViewState();
}

class _ProfileSettingsViewState extends ConsumerState<SettingsView> {
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
                    height: DeviceSize.kHeight(context) * 0.15,
                    child: Row(
                      children: [
                        CircleAvatar(
                            backgroundColor:
                                currentTheme.scaffoldBackgroundColor,
                            radius: 100,
                            child: const Text('buraya takıl')),
                        Text(
                          "John Dee",
                          style: currentTheme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    height: DeviceSize.kHeight(context) * 0.7,
                    child: ListView(children: [
                      SettingsCategoryRow(
                          headerText: "kProfileSettingsAccount".tr(),
                          iconData: Icons.account_circle),
                      SettingsListTile(
                          text: "kProfileSettingsEditProfile".tr(),
                          trailingChild: Icon(
                            Icons.arrow_forward_ios,
                            color: currentTheme.indicatorColor,
                          )),
                      SettingsListTile(
                          text: "kProfileSettingsChangePassword".tr(),
                          trailingChild: Icon(
                            Icons.arrow_forward_ios,
                            color: currentTheme.indicatorColor,
                          )),
                      SettingsListTile(
                          text: "kProfileSettingsGoogle".tr(),
                          trailingChild: Icon(
                            Icons.arrow_forward_ios,
                            color: currentTheme.indicatorColor,
                          )),
                      SettingsCategoryRow(
                          headerText: "kProfileSettingsMore".tr(),
                          iconData: Icons.dashboard_customize_outlined),
                      SettingsListTile(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return const LanguageBottomSheet();
                                });
                          },
                          text: "kProfileSettingsLanguage".tr(),
                          trailingChild: Icon(
                            Icons.arrow_forward_ios,
                            color: currentTheme.indicatorColor,
                          )),
                      SettingsListTile(
                          text: "kProfileSettingsCountry".tr(),
                          trailingChild: Icon(
                            Icons.arrow_forward_ios,
                            color: currentTheme.indicatorColor,
                          )),
                      SettingsListTile(
                          text: "kProfileSettingsDarkTheme".tr(),
                          trailingChild: const CustomSwitch()),
                    ]),
                  ),
                ],
              ),
            )));
  }
}
