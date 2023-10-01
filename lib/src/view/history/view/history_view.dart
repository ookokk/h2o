import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';

class HistoryView extends ConsumerWidget {
  const HistoryView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return SizedBox(
      child: Container(
        color: currentTheme.scaffoldBackgroundColor,
      ),
    );
  }
}
