import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/const/strings.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:numberpicker/numberpicker.dart';

class WeightPicker extends ConsumerStatefulWidget {
  const WeightPicker({
    Key? key,
  }) : super(key: key);
  @override
  WeightPickerState createState() => WeightPickerState();
}

class WeightPickerState extends ConsumerState<WeightPicker> {
  int _weight = 70;

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    return Row(
      children: <Widget>[
        NumberPicker(
          textStyle: currentTheme.textTheme.headlineMedium,
          value: _weight,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.grey)),
          minValue: 40,
          maxValue: 150,
          onChanged: (value) {
            setState(() {
              _weight = value;
            });
          },
          itemHeight: 70,
          axis: Axis.vertical,
        ),
        const SizedBox(
          width: 24,
        ),
        Text(
          Strings.kFirstWeightKG,
          style: currentTheme.textTheme.displayMedium,
        ),
      ],
    );
  }
}
