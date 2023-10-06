import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';

class LanguageBottomSheet extends ConsumerWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: currentTheme.shadowColor,
                blurRadius: 5,
                offset: const Offset(0, 3))
          ],
          color: currentTheme.canvasColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.language,
                color: currentTheme.indicatorColor,
              ),
              title: Text(
                "Turkish",
                style: currentTheme.textTheme.headlineLarge,
              ),
              onTap: () {
                context.setLocale(const Locale('tr', 'TR'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.language,
                color: currentTheme.indicatorColor,
              ),
              title: Text(
                'English',
                style: currentTheme.textTheme.headlineLarge,
              ),
              onTap: () {
                context.setLocale(const Locale('en', 'US'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.language, color: currentTheme.indicatorColor),
              title: Text(
                'Dutch',
                style: currentTheme.textTheme.headlineLarge,
              ),
              onTap: () {
                context.setLocale(const Locale('nl', 'NL'));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
