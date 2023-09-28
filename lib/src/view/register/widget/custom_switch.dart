import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({
    Key? key,
  }) : super(key: key);
  @override
  CustomSwitchState createState() => CustomSwitchState();
}

class CustomSwitchState extends State<CustomSwitch> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.5,
      child: Switch(
        value: _isChecked,
        onChanged: (newValue) {
          setState(() {
            _isChecked = newValue;
          });
        },
        activeTrackColor: Colors.blue,
        activeColor: Colors.blue,
        inactiveThumbColor: Colors.pink,
        inactiveTrackColor: Colors.pinkAccent,
      ),
    );
  }
}
