import 'package:flutter/material.dart';

class CustomTextTheme {
  CustomTextTheme._init();
  static CustomTextTheme? _instance;
  static CustomTextTheme? get instance {
    _instance ??= CustomTextTheme._init();
    return _instance;
  }

  final TextStyle headline1 = const TextStyle(
    fontFamily: "Poppins",
    fontSize: 38,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  );
  final TextStyle headline2 = const TextStyle(
    fontFamily: "Poppins",
    fontSize: 34,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  );
  final TextStyle headline3 = const TextStyle(
    fontFamily: "Poppins",
    fontSize: 28,
    fontWeight: FontWeight.w400,
  );
  final TextStyle headline4 = const TextStyle(
    fontFamily: "Poppins",
    fontSize: 26,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );
  final TextStyle headline5 = const TextStyle(
    fontFamily: "Poppins",
    fontSize: 24,
    fontWeight: FontWeight.w400,
  );
  final TextStyle headline6 = const TextStyle(
    fontFamily: "Poppins",
    fontSize: 20,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  );
  final TextStyle headline7 = const TextStyle(
    fontFamily: "Poppins",
    fontSize: 18,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  );
  final TextStyle headline8 = const TextStyle(
    fontFamily: "Poppins",
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  );
  final TextStyle headline9 = const TextStyle(
    fontFamily: "Poppins",
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  );
}
