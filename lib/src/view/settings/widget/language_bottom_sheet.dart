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
      child: SingleChildScrollView(
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
              buildListTile(currentTheme, context, "English", () {
                context.setLocale(const Locale('en', 'US'));
                Navigator.pop(context);
              }),
              buildListTile(currentTheme, context, "Turkish", () {
                context.setLocale(const Locale('tr', 'TR'));
                Navigator.pop(context);
              }),
              buildListTile(currentTheme, context, "Nederland", () {
                context.setLocale(const Locale('nl', 'NL'));
                Navigator.pop(context);
              }),
              buildListTile(currentTheme, context, "Arabic", () {
                context.setLocale(const Locale('ar', 'SA'));
                Navigator.pop(context);
              }),
              buildListTile(currentTheme, context, "German", () {
                context.setLocale(const Locale('de', 'DE'));
                Navigator.pop(context);
              }),
              buildListTile(currentTheme, context, "Spanish", () {
                context.setLocale(const Locale('es', 'ES'));
                Navigator.pop(context);
              }),
              buildListTile(currentTheme, context, "French", () {
                context.setLocale(const Locale('fr', 'FR'));
                Navigator.pop(context);
              }),
              buildListTile(currentTheme, context, "Japanese", () {
                context.setLocale(const Locale('ja', 'JP'));
                Navigator.pop(context);
              }),
              buildListTile(currentTheme, context, "Portuguese", () {
                context.setLocale(const Locale('pt', 'BR'));
                Navigator.pop(context);
              }),
              buildListTile(currentTheme, context, "Chinese", () {
                context.setLocale(const Locale('zh', 'CN'));
                Navigator.pop(context);
              }),
              buildListTile(currentTheme, context, "Russian", () {
                context.setLocale(const Locale('ru', 'RU'));
                Navigator.pop(context);
              }),
            ],
          ),
        ),
      ),
    );
  }

  ListTile buildListTile(ThemeData currentTheme, BuildContext context,
      String listTileText, VoidCallback listTileOnTap) {
    return ListTile(
      leading: Icon(
        Icons.language,
        color: currentTheme.indicatorColor,
      ),
      title: Text(
        listTileText,
        style: currentTheme.textTheme.headlineLarge,
      ),
      onTap: listTileOnTap,
    );
  }
}
