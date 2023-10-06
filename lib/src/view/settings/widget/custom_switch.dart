import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';

class CustomSwitch extends ConsumerStatefulWidget {
  const CustomSwitch({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends ConsumerState<CustomSwitch> {
  bool internalValue = false;

  @override
  void initState() {
    super.initState();
    internalValue = ref.read(themeProvider.notifier).isDarkTheme();
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    return GestureDetector(
      onTap: () {
        ref.read(themeProvider.notifier).toggleTheme();
        internalValue = !internalValue;
      },
      child: Container(
        width: 60.0,
        height: 34.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17.0),
          color: internalValue
              ? currentTheme.dialogBackgroundColor
              : currentTheme.canvasColor,
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
              curve: Curves.ease,
              left: internalValue ? 26.0 : 0.0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                width: 27.0,
                height: 32.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentTheme.scaffoldBackgroundColor,
                ),
                child: Center(
                    child: internalValue
                        ? const Icon(Icons.light_mode_outlined)
                        : const Icon(
                            Icons.light_mode,
                          )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
