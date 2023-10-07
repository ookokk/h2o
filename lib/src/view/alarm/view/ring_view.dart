import 'package:alarm/alarm.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/const/device_size.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:lottie/lottie.dart';

class RingView extends ConsumerWidget {
  final AlarmSettings alarmSettings;

  const RingView({Key? key, required this.alarmSettings}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: currentTheme.scaffoldBackgroundColor,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "${"kAlarmYourAlarm".tr()} ${"kAlarmIsRinging".tr()}",
                style: currentTheme.textTheme.displayLarge,
              ),
              Lottie.asset('assets/animations/alarm.json',
                  height: DeviceSize.kHeight(context) * 0.3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RawMaterialButton(
                    onPressed: () {
                      final now = DateTime.now();
                      Alarm.set(
                        alarmSettings: alarmSettings.copyWith(
                          dateTime: DateTime(
                            now.year,
                            now.month,
                            now.day,
                            now.hour,
                            now.minute,
                            0,
                            0,
                          ).add(const Duration(minutes: 1)),
                        ),
                      ).then((_) => Navigator.pop(context));
                    },
                    child: Text(
                      "kAlarmSnooze".tr(),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  RawMaterialButton(
                    onPressed: () {
                      Alarm.stop(alarmSettings.id)
                          .then((_) => Navigator.pop(context));
                    },
                    child: Text(
                      "kAlarmStop".tr(),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
