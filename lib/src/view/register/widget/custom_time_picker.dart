import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/const/device_size.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';

class CustomTimePicker extends ConsumerStatefulWidget {
  final ValueChanged<TimeOfDay> onTimeSelected;
  const CustomTimePicker({Key? key, required this.onTimeSelected})
      : super(key: key);
  @override
  CustomTimePickerState createState() => CustomTimePickerState();
}

class CustomTimePickerState extends ConsumerState<CustomTimePicker> {
  TimeOfDay _selectedTime = TimeOfDay.now();
  Future<void> _selectTime(BuildContext context) async {
    final currentTheme = ref.watch(themeProvider);
    final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: _selectedTime,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(primaryColor: currentTheme.primaryColor),
            child: child!,
          );
        });
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        widget.onTimeSelected(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    return SizedBox(
      height: DeviceSize.kHeight(context) * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () => _selectTime(context),
            child: Text(
              "${_selectedTime.hour.toString().padLeft(2, '0')}:${_selectedTime.minute.toString().padLeft(2, '0')}",
              style: currentTheme.textTheme.bodyLarge?.copyWith(fontSize: 65),
            ),
          ),
        ],
      ),
    );
  }
}
