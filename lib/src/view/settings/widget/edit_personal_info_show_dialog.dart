import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/const/strings.dart';
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
          Strings.kSettingsDeletePersonalInfo,
          style: currentTheme.textTheme.bodySmall,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              Strings.kSettingsAreYouSure,
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
              Strings.kSettingsNo,
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
                Strings.kSettingsYes,
                style: currentTheme.textTheme.headlineMedium,
              ),
            ),
          ),
        ],
      );
    },
  );
}
