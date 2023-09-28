import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onTap;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 0.8);
  const CustomAppBar({Key? key, this.onTap, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return AppBar(
      centerTitle: true,
      title: Text(
        title ?? "",
        style: currentTheme.textTheme.displaySmall,
      ),
      elevation: 1,
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      leading: IconButton(
        onPressed: onTap ?? () {},
        icon: Icon(color: currentTheme.indicatorColor, Icons.arrow_back_ios),
      ),
    );
  }
}
