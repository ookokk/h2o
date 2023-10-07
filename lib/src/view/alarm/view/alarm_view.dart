import 'package:alarm/alarm.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/const/device_size.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:h2o_flutter/src/view/alarm/viewmodel/ialarm_state.dart';
import 'package:h2o_flutter/src/view/alarm/widget/alarm_tile.dart';
import 'package:h2o_flutter/src/view/alarm/widget/shortcut_button.dart';

class AlarmView extends ConsumerStatefulWidget {
  const AlarmView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AlarmViewState();
}

class _AlarmViewState extends ConsumerState<AlarmView> with IAlarmState {
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: currentTheme.scaffoldBackgroundColor,
        body: SafeArea(
          child: alarms.isNotEmpty
              ? ListView.separated(
                  itemCount: alarms.length,
                  separatorBuilder: (context, index) =>
                      const Divider(height: 1),
                  itemBuilder: (context, index) {
                    return AlarmTile(
                      key: Key(alarms[index].id.toString()),
                      title: TimeOfDay(
                        hour: alarms[index].dateTime.hour,
                        minute: alarms[index].dateTime.minute,
                      ).format(context),
                      onPressed: () => navigateToAlarmScreen(alarms[index]),
                      onDismissed: () {
                        Alarm.stop(alarms[index].id).then((_) => loadAlarms());
                      },
                    );
                  },
                )
              : Center(
                  child: Text(
                    "kAlarmNoAlarm".tr(),
                    style: currentTheme.textTheme.headlineLarge,
                  ),
                ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShortcutButton(refreshAlarms: loadAlarms),
              ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(
                        DeviceSize.kWidth(context) * 0.25,
                        DeviceSize.kHeight(context) * 0.07,
                      ),
                    ),
                    maximumSize: MaterialStateProperty.all<Size>(
                      Size(
                        DeviceSize.kWidth(context) * 0.25,
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
                  onPressed: () => navigateToAlarmScreen(null),
                  child: const Icon(
                    Icons.alarm_add_outlined,
                    size: 35,
                  )),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
