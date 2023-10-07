import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';

Future<dynamic> editPersonalInfoShowDialog(
    BuildContext context, WidgetRef ref) {
  final currentTheme = ref.watch(themeProvider);
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: currentTheme.scaffoldBackgroundColor,
        title: Text(
          "kSettingsDeletePersonalInfo".tr(),
          style: currentTheme.textTheme.bodySmall,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "kSettingsAreYouSure".tr(),
              style: currentTheme.textTheme.headlineLarge,
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "kSettingsNo".tr(),
              style: currentTheme.textTheme.headlineMedium,
            ),
          ),
          Card(
            color: Colors.red,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/register', (route) => false);
              },
              child: Text(
                "kSettingsYes".tr(),
                style: currentTheme.textTheme.headlineMedium,
              ),
            ),
          ),
        ],
      );
    },
  );
}
