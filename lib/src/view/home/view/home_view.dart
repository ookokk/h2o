import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/generated/locale_keys.g.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:h2o_flutter/src/product/widget/home_app_bar.dart';
import 'package:h2o_flutter/src/view/today/view/today_view.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
      child: Scaffold(
        appBar: HomeAppBar(
          title: LocaleKeys.kHomeHydration.tr(),
          leftIconOnTap: () {
            Navigator.pushNamed(context, '/settings');
          },
          rightIconOnTap: () {
            Navigator.pushNamed(context, '/alarm');
          },
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: currentTheme.scaffoldBackgroundColor,
        body: const Center(child: TodayView()),
      ),
    );
  }
}
