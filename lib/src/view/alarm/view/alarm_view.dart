import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/view/alarm/viewmodel/ialarm_state.dart';

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
