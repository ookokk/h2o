import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';

class HomeAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? leftIconOnTap;
  final VoidCallback? rightIconOnTap;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const HomeAppBar(
      {Key? key, this.leftIconOnTap, this.title, this.rightIconOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return AppBar(
      centerTitle: true,
      title: Text(
        title ?? "",
        style: currentTheme.textTheme.displaySmall
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      elevation: 0,
      actions: [
        IconButton(
            onPressed: rightIconOnTap ?? () {},
            icon: Icon(
              Icons.notifications,
              color: currentTheme.indicatorColor,
            ))
      ],
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      leading: IconButton(
        onPressed: leftIconOnTap ?? () {},
        icon: Icon(color: currentTheme.indicatorColor, Icons.waves),
      ),
    );
  }
}
