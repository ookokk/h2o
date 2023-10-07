import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:h2o_flutter/src/view/get_started/widget/get_started_button.dart';
import 'package:h2o_flutter/src/view/register/view/fifth_tab_view.dart';
import 'package:h2o_flutter/src/view/register/view/first_tab_view.dart';
import 'package:h2o_flutter/src/view/register/view/fourth_tab_view.dart';
import 'package:h2o_flutter/src/view/register/view/second_tab_view.dart';
import 'package:h2o_flutter/src/view/register/view/third_tab_view.dart';

class RegisterView extends ConsumerWidget {
  RegisterView({
    Key? key,
  }) : super(key: key);
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
      child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: GetStartedButton(
            text: "kFirstNextBtn".tr(),
            onTap: () {
              if (_pageController.page != 4) {
                _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              } else {
                Navigator.pushNamed(context, '/almost');
              }
            },
          ),
          backgroundColor: currentTheme.scaffoldBackgroundColor,
          body: PageView(
            controller: _pageController,
            children: const [
              FirstTabView(),
              SecondTabView(),
              ThirdTabView(),
              FourthTabView(),
              FifthTabView(),
            ],
          )),
    );
  }
}
