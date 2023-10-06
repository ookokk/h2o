import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/const/strings.dart';
import 'package:h2o_flutter/src/view/alarm/view/edit_alarm_view.dart';

mixin IEditAlarmState on ConsumerState<EditAlarmView> {
  bool loading = false;
  late bool creating;
  late DateTime selectedDateTime;
  late bool loopAudio;
  late bool vibrate;
  late bool volumeMax;
  late bool showNotification;
  late String assetAudio;

  @override
  void initState() {
    super.initState();
    creating = widget.alarmSettings == null;

    if (creating) {
      selectedDateTime = DateTime.now().add(const Duration(minutes: 1));
      selectedDateTime = selectedDateTime.copyWith(second: 0, millisecond: 0);
      loopAudio = true;
      vibrate = true;
      volumeMax = false;
      showNotification = true;
      assetAudio = 'assets/sounds/water.mp3';
    } else {
      selectedDateTime = widget.alarmSettings!.dateTime;
      loopAudio = widget.alarmSettings!.loopAudio;
      vibrate = widget.alarmSettings!.vibrate;
      volumeMax = widget.alarmSettings!.volumeMax;
      showNotification = widget.alarmSettings!.notificationTitle != null &&
          widget.alarmSettings!.notificationTitle!.isNotEmpty &&
          widget.alarmSettings!.notificationBody != null &&
          widget.alarmSettings!.notificationBody!.isNotEmpty;
      assetAudio = widget.alarmSettings!.assetAudioPath;
    }
  }

  String getDay() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final difference = selectedDateTime.difference(today).inDays;

    if (difference == 0) {
      return Strings.kAlarmToday;
    } else if (difference == 1) {
      return Strings.kAlarmTomorrow;
    } else if (difference == 2) {
      return Strings.kAlarmAfterTomorrow;
    } else {
      return 'In $difference days';
    }
  }

  Future<void> pickTime() async {
    final res = await showTimePicker(
      initialTime: TimeOfDay.fromDateTime(selectedDateTime),
      context: context,
    );

    if (res != null) {
      setState(() {
        selectedDateTime = selectedDateTime.copyWith(
          hour: res.hour,
          minute: res.minute,
        );
        if (selectedDateTime.isBefore(DateTime.now())) {
          selectedDateTime = selectedDateTime.add(const Duration(days: 1));
        }
      });
    }
  }

  AlarmSettings buildAlarmSettings() {
    final id = creating
        ? DateTime.now().millisecondsSinceEpoch % 10000
        : widget.alarmSettings!.id;

    final alarmSettings = AlarmSettings(
      id: id,
      dateTime: selectedDateTime,
      loopAudio: loopAudio,
      vibrate: vibrate,
      volumeMax: volumeMax,
      notificationTitle:
          showNotification ? Strings.kAlarmNotificationTitle : null,
      notificationBody: showNotification ? 'Your alarm ($id) is ringing' : null,
      assetAudioPath: assetAudio,
    );
    return alarmSettings;
  }

  void saveAlarm() {
    setState(() => loading = true);
    Alarm.set(alarmSettings: buildAlarmSettings()).then((res) {
      if (res) Navigator.pop(context, true);
    });
    setState(() => loading = false);
  }

  void deleteAlarm() {
    Alarm.stop(widget.alarmSettings!.id).then((res) {
      if (res) Navigator.pop(context, true);
    });
  }
}
