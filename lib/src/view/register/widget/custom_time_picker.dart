import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/const/strings.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:h2o_flutter/src/view/register/view_model/fourth_tab_view_model.dart';

class CustomTimePicker extends ConsumerWidget {
  const CustomTimePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wakeUpTime = ref.watch(wakeUpTimeProvider);
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
          initialTime: wakeUpTime ?? TimeOfDay.now(),
        );

        if (selectedTime != null) {
          ref.read(wakeUpTimeProvider.notifier).state = selectedTime;
        }
      },
      child: Text(
        wakeUpTime != null
            ? '${wakeUpTime.hour}:${wakeUpTime.minute.toString().padLeft(2, '0')}'
            : Strings.kFourthSelectTime,
        style: currentTheme.textTheme.bodyLarge
            ?.copyWith(fontSize: 60, fontWeight: FontWeight.w500),
      ),
    );
  }
}
