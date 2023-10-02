import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/const/strings.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:h2o_flutter/src/view/register/view_model/fourth_tab_view_model.dart';

class CustomBedTimePicker extends ConsumerWidget {
  const CustomBedTimePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bedTime = ref.watch(bedTimeProvider);
    final currentTheme = ref.watch(themeProvider);
    return InkWell(
      onTap: () async {
        final selectedTime = await showTimePicker(
          builder: (BuildContext context, Widget? child) {
            return Theme(
                data: ThemeData(primaryColor: currentTheme.primaryColor),
                child: child!);
          },
          context: context,
          initialTime: bedTime ?? TimeOfDay.now(),
        );

        if (selectedTime != null) {
          ref.read(bedTimeProvider.notifier).state = selectedTime;
        }
      },
      child: Text(
        bedTime != null
            ? '${bedTime.hour}:${bedTime.minute.toString().padLeft(2, '0')}'
            : Strings.kFourthSelectTime,
        style: currentTheme.textTheme.bodyLarge
            ?.copyWith(fontSize: 60, fontWeight: FontWeight.w500),
      ),
    );
  }
}
