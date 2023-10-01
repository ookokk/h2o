import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';

class CustomNavBar extends ConsumerWidget {
  final Function(int) onItemTapped;
  final int selectedIndex;

  const CustomNavBar({
    Key? key,
    required this.onItemTapped,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return BottomNavigationBar(
      selectedLabelStyle: currentTheme.textTheme.headlineMedium
          ?.copyWith(fontWeight: FontWeight.bold),
      unselectedLabelStyle: currentTheme.textTheme.headlineMedium,
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/images/navbar_water.svg',
            height: 40,
          ),
          label: 'Today',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/images/history.svg',
            height: 35,
          ),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/images/profile.svg',
            height: 40,
          ),
          label: 'Me',
        ),
      ],
    );
  }
}
