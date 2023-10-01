import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:h2o_flutter/src/product/widget/custom_nav_bar.dart';
import 'package:h2o_flutter/src/view/history/view/history_view.dart';
import 'package:h2o_flutter/src/view/profile/view/profile_view.dart';
import 'package:h2o_flutter/src/view/today/view/today_view.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  int selectedIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: currentTheme.scaffoldBackgroundColor,
        body: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          children: [
            TodayView(),
            const HistoryView(),
            const ProfileView(),
          ],
        ),
        bottomNavigationBar: CustomNavBar(
          selectedIndex: selectedIndex,
          onItemTapped: onItemTapped,
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
