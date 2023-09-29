import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/const/device_size.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:h2o_flutter/src/product/widget/custom_nav_bar.dart';
import 'package:lottie/lottie.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  int selectedIndex = 0;
  late PageController pageController;
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
      bottomNavigationBar: CustomNavBar(
        onItemTapped: onItemTapped,
        selectedIndex: selectedIndex,
      ),
      body: SizedBox(
        height: DeviceSize.kHeight(context),
        child: Stack(
          children: [
            Lottie.asset(
              'assets/animations/home.json',
              animate: false,
              height: double.infinity,
              alignment: Alignment.topCenter,
            )
          ],
        ),
      ),
    ));
  }
}
