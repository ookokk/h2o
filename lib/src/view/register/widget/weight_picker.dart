import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/const/device_size.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:h2o_flutter/src/view/register/view_model/second_tab_view_model.dart';
import 'package:numberpicker/numberpicker.dart';

class WeightPicker extends ConsumerStatefulWidget {
  const WeightPicker({
    Key? key,
  }) : super(key: key);
  @override
  WeightPickerState createState() => WeightPickerState();
}

class WeightPickerState extends ConsumerState<WeightPicker> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    final weight = ref.watch(weightProvider.notifier).state;
    return SizedBox(
      height: DeviceSize.kHeight(context) * 0.4,
      child: Row(
        children: <Widget>[
          NumberPicker(
            textStyle: currentTheme.textTheme.headlineMedium,
            value: weight,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.grey)),
            minValue: 40,
            maxValue: 150,
            onChanged: (value) {
              setState(() {
                ref.read(weightProvider.notifier).state = value;
              });
            },
            itemHeight: 70,
            axis: Axis.vertical,
          ),
          const SizedBox(
            width: 24,
          ),
          Text(
            "kFirstWeightKG".tr(),
            style: currentTheme.textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}
