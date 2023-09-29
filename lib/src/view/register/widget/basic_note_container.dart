import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';

class BasicNoteContainer extends ConsumerWidget {
  final String imagePath;
  final String text;

  const BasicNoteContainer({
    Key? key,
    required this.imagePath,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return Container(
        margin: const EdgeInsets.all(18),
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 0.8,
          ),
        ),
        child: Row(
          children: [
            Expanded(flex: 1, child: SvgPicture.asset(imagePath)),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              flex: 4,
              child: Text(text, style: currentTheme.textTheme.headlineMedium),
            ),
          ],
        ));
  }
}
