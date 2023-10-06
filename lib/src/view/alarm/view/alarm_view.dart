import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/const/strings.dart';
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
                    Strings.kAlarmNoAlarm,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShortcutButton(refreshAlarms: loadAlarms),
              FloatingActionButton(
                onPressed: () => navigateToAlarmScreen(null),
                child: const Icon(Icons.alarm_add_rounded, size: 33),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
