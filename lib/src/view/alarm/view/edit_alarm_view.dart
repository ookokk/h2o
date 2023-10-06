import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/const/strings.dart';
import 'package:h2o_flutter/src/view/alarm/viewmodel/iedit_alarm_state.dart';

class EditAlarmView extends ConsumerStatefulWidget {
  final AlarmSettings? alarmSettings;

  const EditAlarmView({Key? key, this.alarmSettings}) : super(key: key);

  @override
  ConsumerState<EditAlarmView> createState() => _EditAlarmViewState();
}

class _EditAlarmViewState extends ConsumerState<EditAlarmView>
    with IEditAlarmState {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(
                  Strings.kAlarmCancel,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.blueAccent),
                ),
              ),
              TextButton(
                onPressed: saveAlarm,
                child: loading
                    ? const CircularProgressIndicator()
                    : Text(
                        Strings.kAlarmSave,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.blueAccent),
                      ),
              ),
            ],
          ),
          Text(
            getDay(),
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.blueAccent.withOpacity(0.8)),
          ),
          RawMaterialButton(
            onPressed: pickTime,
            fillColor: Colors.grey[200],
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Text(
                TimeOfDay.fromDateTime(selectedDateTime).format(context),
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: Colors.blueAccent),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.kAlarmLoopAudio,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Switch(
                value: loopAudio,
                onChanged: (value) => setState(() => loopAudio = value),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.kAlarmVibrate,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Switch(
                value: vibrate,
                onChanged: (value) => setState(() => vibrate = value),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.kAlarmSystemVolume,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Switch(
                value: volumeMax,
                onChanged: (value) => setState(() => volumeMax = value),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.kAlarmShowNotification,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Switch(
                value: showNotification,
                onChanged: (value) => setState(() => showNotification = value),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.kAlarmSound,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              DropdownButton(
                value: assetAudio,
                items: const [
                  DropdownMenuItem<String>(
                    value: 'assets/sounds/water.mp3',
                    child: Text(Strings.kAlarmWater),
                  ),
                  DropdownMenuItem<String>(
                    value: 'assets/nokia.mp3',
                    child: Text(Strings.kAlarmNokia),
                  ),
                  DropdownMenuItem<String>(
                    value: 'assets/mozart.mp3',
                    child: Text(Strings.kAlarmMozart),
                  ),
                  DropdownMenuItem<String>(
                    value: 'assets/star_wars.mp3',
                    child: Text(Strings.kAlarmStarWars),
                  ),
                  DropdownMenuItem<String>(
                    value: 'assets/one_piece.mp3',
                    child: Text(Strings.kAlarmOnePiece),
                  ),
                ],
                onChanged: (value) => setState(() => assetAudio = value!),
              ),
            ],
          ),
          if (!creating)
            TextButton(
              onPressed: deleteAlarm,
              child: Text(
                Strings.kAlarmDeleteAlarm,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.red),
              ),
            ),
          const SizedBox(),
        ],
      ),
    );
  }
}
