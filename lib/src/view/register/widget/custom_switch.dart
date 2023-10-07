import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/view/register/view_model/first_tab_view_model.dart';

class CustomSwitch extends ConsumerWidget {
  const CustomSwitch({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isChecked = ref.watch(isCheckedProvider);
    return Transform.scale(
      scale: 1.5,
      child: Switch(
        value: isChecked,
        onChanged: (newValue) {
          ref.read(isCheckedProvider.notifier).state = newValue;
        },
        activeTrackColor: Colors.blue,
        activeColor: Colors.blue,
        inactiveThumbColor: Colors.pink,
        inactiveTrackColor: Colors.pinkAccent,
      ),
    );
  }
}
