import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';

class SettingsCategoryRow extends ConsumerStatefulWidget {
  final String headerText;
  final IconData iconData;
  const SettingsCategoryRow({
    Key? key,
    required this.headerText,
    required this.iconData,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SettingsCategoryRowState();
}

class _SettingsCategoryRowState extends ConsumerState<SettingsCategoryRow> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    return Row(
      children: [
        Icon(
          widget.iconData,
          size: 35,
          color: currentTheme.indicatorColor,
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          widget.headerText,
          style: currentTheme.textTheme.displaySmall,
        )
      ],
    );
  }
}
