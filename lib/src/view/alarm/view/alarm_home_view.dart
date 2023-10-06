/*
import 'dart:async';
import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:h2o_flutter/src/view/alarm/view/ring_view.dart';
import 'package:h2o_flutter/src/view/alarm/widget/alarm_tile.dart';
import 'package:h2o_flutter/src/view/alarm/widget/shortcut_button.dart';
import 'edit_alarm_view.dart';

class AlarmHomeView extends StatefulWidget {
  const AlarmHomeView({Key? key}) : super(key: key);

  @override
  State<AlarmHomeView> createState() => _AlarmHomeViewState();
}

class _AlarmHomeViewState extends State<AlarmHomeView> {
  late List<AlarmSettings> alarms;

  static StreamSubscription? subscription;

  @override
  void initState() {
    super.initState();
    loadAlarms();
    subscription ??= Alarm.ringStream.stream.listen(
      (alarmSettings) => navigateToRingScreen(alarmSettings),
    );
  }

  void loadAlarms() {
    setState(() {
      alarms = Alarm.getAlarms();
      alarms.sort((a, b) => a.dateTime.isBefore(b.dateTime) ? 0 : 1);
    });
  }

  Future<void> navigateToRingScreen(AlarmSettings alarmSettings) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RingView(alarmSettings: alarmSettings),
        ));
    loadAlarms();
  }

  Future<void> navigateToAlarmScreen(AlarmSettings? settings) async {
    final res = await showModalBottomSheet<bool?>(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.75,
            child: EditAlarmView(alarmSettings: settings),
          );
        });

    if (res != null && res == true) loadAlarms();
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('alarm 2.1.0')),
      body: SafeArea(
        child: alarms.isNotEmpty
            ? ListView.separated(
                itemCount: alarms.length,
                separatorBuilder: (context, index) => const Divider(height: 1),
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
                  "No alarms set",
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
    );
  }
}
*/
