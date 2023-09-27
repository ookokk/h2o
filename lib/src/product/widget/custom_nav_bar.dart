import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: currentTheme.indicatorColor,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color: currentTheme.indicatorColor,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: currentTheme.indicatorColor,
          ),
          label: '',
        ),
      ],
    );
  }
}
