import 'package:alarm/alarm.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/const/device_size.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';

class ShortcutButton extends ConsumerStatefulWidget {
  final void Function() refreshAlarms;

  const ShortcutButton({Key? key, required this.refreshAlarms})
      : super(key: key);

  @override
  ConsumerState<ShortcutButton> createState() => _ShortcutButtonState();
}

class _ShortcutButtonState extends ConsumerState<ShortcutButton> {
  bool showMenu = false;

  Future<void> onPressButton(int delayInHours) async {
    DateTime dateTime = DateTime.now().add(Duration(hours: delayInHours));

    if (delayInHours != 0) {
      dateTime = dateTime.copyWith(second: 0, millisecond: 0);
    }

    setState(() => showMenu = false);

    alarmPrint(dateTime.toString());

    final alarmSettings = AlarmSettings(
      id: DateTime.now().millisecondsSinceEpoch % 10000,
      dateTime: dateTime,
      assetAudioPath: 'assets/sounds/water.mp3',
      volumeMax: true,
    );

    await Alarm.set(alarmSettings: alarmSettings);

    widget.refreshAlarms();
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    return Row(
      children: [
        GestureDetector(
          onLongPress: () {
            setState(() => showMenu = true);
          },
          child: ElevatedButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all<Size>(
                Size(
                  DeviceSize.kWidth(context) * 0.35,
                  DeviceSize.kHeight(context) * 0.07,
                ),
              ),
              maximumSize: MaterialStateProperty.all<Size>(
                Size(
                  DeviceSize.kWidth(context) * 0.35,
                  DeviceSize.kHeight(context) * 0.08,
                ),
              ),
              elevation: MaterialStateProperty.all<double>(3),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(34),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                currentTheme.primaryColor,
              ),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              ),
            ),
            onPressed: () => onPressButton(0),
            child: Text(
              "kAlarmRingNow".tr(),
              textAlign: TextAlign.center,
              style: currentTheme.textTheme.displayMedium,
            ),
          ),
        ),
        if (showMenu)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () => onPressButton(24),
                child: const Text("+24h"),
              ),
              TextButton(
                onPressed: () => onPressButton(36),
                child: const Text("+36h"),
              ),
              TextButton(
                onPressed: () => onPressButton(48),
                child: const Text("+48h"),
              ),
            ],
          ),
      ],
    );
  }
}
