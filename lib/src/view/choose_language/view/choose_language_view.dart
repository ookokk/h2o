// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';

class ChooseLanguageView extends ConsumerStatefulWidget {
  const ChooseLanguageView({
    Key? key,
  }) : super(key: key);

  @override
  ChooseLanguageState createState() => ChooseLanguageState();
}

class ChooseLanguageState extends ConsumerState<ChooseLanguageView> {
  int selectedLanguageIndex = -1;
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            elevation: 5,
            isExtended: true,
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/getStarted', (route) => false);
            },
            backgroundColor: currentTheme.primaryColor,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 35,
              color: currentTheme.canvasColor,
            )),
        backgroundColor: currentTheme.scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 18,
              ),
              Center(
                child: Text(
                  'Choose the language',
                  textAlign: TextAlign.center,
                  style: currentTheme.textTheme.bodySmall,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              buildListTile(currentTheme, context, "English", () {
                context.setLocale(const Locale('en', 'US'));
                setSelectedLanguageIndex(0);
              }, "assets/images/english.svg", 0),
              buildListTile(currentTheme, context, "Turkish", () {
                context.setLocale(const Locale('tr', 'TR'));
                setSelectedLanguageIndex(1);
              }, "assets/images/turkish.svg", 1),
              buildListTile(currentTheme, context, "Nederland", () {
                context.setLocale(const Locale('nl', 'NL'));
                setSelectedLanguageIndex(2);
              }, "assets/images/nederland.svg", 2),
              buildListTile(currentTheme, context, "Arabic", () {
                context.setLocale(const Locale('ar', 'SA'));
                setSelectedLanguageIndex(3);
              }, "assets/images/arabic.svg", 3),
              buildListTile(currentTheme, context, "German", () {
                context.setLocale(const Locale('de', 'DE'));
                setSelectedLanguageIndex(4);
              }, "assets/images/german.svg", 4),
              buildListTile(currentTheme, context, "Spanish", () {
                context.setLocale(const Locale('es', 'ES'));
                setSelectedLanguageIndex(5);
              }, "assets/images/spanish.svg", 5),
              buildListTile(currentTheme, context, "French", () {
                context.setLocale(const Locale('fr', 'FR'));
                setSelectedLanguageIndex(6);
              }, "assets/images/french.svg", 6),
              buildListTile(currentTheme, context, "Japanese", () {
                context.setLocale(const Locale('ja', 'JP'));
                setSelectedLanguageIndex(7);
              }, "assets/images/japanese.svg", 7),
              buildListTile(currentTheme, context, "Portuguese", () {
                context.setLocale(const Locale('pt', 'BR'));
                setSelectedLanguageIndex(8);
              }, "assets/images/portuguese.svg", 8),
              buildListTile(currentTheme, context, "Chinese", () {
                context.setLocale(const Locale('zh', 'CN'));
                setSelectedLanguageIndex(9);
              }, "assets/images/chinese.svg", 9),
              buildListTile(currentTheme, context, "Russian", () {
                context.setLocale(const Locale('ru', 'RU'));
                setSelectedLanguageIndex(10);
              }, "assets/images/russian.svg", 10),
            ],
          ),
        ),
      ),
    );
  }

  void setSelectedLanguageIndex(int index) {
    setState(() {
      selectedLanguageIndex = index;
    });
  }

  ListTile buildListTile(
      ThemeData currentTheme,
      BuildContext context,
      String listTileText,
      VoidCallback listTileOnTap,
      String imagePath,
      int index) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8),
      tileColor: selectedLanguageIndex == index
          ? currentTheme.cardColor.withOpacity(0.5)
          : null,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(imagePath, height: 40),
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: Text(
          listTileText,
          style: currentTheme.textTheme.displaySmall,
        ),
      ),
      onTap: listTileOnTap,
    );
  }
}
