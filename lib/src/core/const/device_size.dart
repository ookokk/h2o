import 'package:flutter/material.dart';

class DeviceSize {
  static double kWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double kHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
}
