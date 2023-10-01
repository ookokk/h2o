import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/init/theme/custom_text_theme.dart';

final themeProvider =
    StateNotifierProvider.autoDispose<ThemeProvider, ThemeData>((ref) {
  return ThemeProvider();
});

class ThemeProvider extends StateNotifier<ThemeData> {
  ThemeProvider() : super(lightTheme);
  ThemeData currentTheme = lightTheme;
  bool isDarkTheme() {
    return state == darkTheme;
  }

  void toggleTheme() {
    currentTheme = (currentTheme == lightTheme) ? darkTheme : lightTheme;
    state = currentTheme;
  }

  ThemeData get getCurrentTheme => currentTheme;

  static final ThemeData lightTheme = ThemeData(
    indicatorColor: Colors.black,
    brightness: Brightness.light,
    cardColor: const Color(0xff94c359),
    shadowColor: const Color(0xffcfdcec),
    dialogBackgroundColor: const Color(0xffF39F5A),
    canvasColor: const Color(0xfff0f0f0),
    primaryColor: const Color(0xff265cbe),
    disabledColor: const Color(0xff6499E9),
    textTheme: TextTheme(
      bodyLarge:
          CustomTextTheme.instance!.headline38.copyWith(color: Colors.black),
      bodyMedium:
          CustomTextTheme.instance!.headline34.copyWith(color: Colors.black),
      bodySmall:
          CustomTextTheme.instance!.headline28.copyWith(color: Colors.black),
      displayLarge:
          CustomTextTheme.instance!.headline26.copyWith(color: Colors.black),
      labelLarge:
          CustomTextTheme.instance!.headline24.copyWith(color: Colors.black),
      displayMedium:
          CustomTextTheme.instance!.headline20.copyWith(color: Colors.black),
      displaySmall:
          CustomTextTheme.instance!.headline18.copyWith(color: Colors.black),
      headlineLarge:
          CustomTextTheme.instance!.headline16.copyWith(color: Colors.black),
      headlineMedium:
          CustomTextTheme.instance!.headline14.copyWith(color: Colors.black),
    ),
    scaffoldBackgroundColor: Colors.white,
    bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xff73a9e6)),
  );

  static final ThemeData darkTheme = ThemeData(
    indicatorColor: Colors.white,
    disabledColor: const Color(0xff6499E9),
    cardColor: const Color(0xff73a9e6),
    shadowColor: const Color(0xff343942),
    primaryColor: const Color(0xff5d5d5d),
    canvasColor: const Color(0xffcdcdd2),
    dialogBackgroundColor: const Color(0xffF39F5A),
    brightness: Brightness.dark,
    textTheme: TextTheme(
      bodyLarge:
          CustomTextTheme.instance!.headline38.copyWith(color: Colors.white),
      bodyMedium:
          CustomTextTheme.instance!.headline34.copyWith(color: Colors.white),
      bodySmall:
          CustomTextTheme.instance!.headline28.copyWith(color: Colors.white),
      displayLarge:
          CustomTextTheme.instance!.headline26.copyWith(color: Colors.white),
      labelLarge:
          CustomTextTheme.instance!.headline24.copyWith(color: Colors.white),
      displayMedium:
          CustomTextTheme.instance!.headline20.copyWith(color: Colors.white),
      displaySmall:
          CustomTextTheme.instance!.headline18.copyWith(color: Colors.white),
      headlineLarge:
          CustomTextTheme.instance!.headline16.copyWith(color: Colors.white),
      headlineMedium:
          CustomTextTheme.instance!.headline14.copyWith(color: Colors.white),
    ),
    scaffoldBackgroundColor: const Color(0xff27323a),
    bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xff5d5d5d)),
  );
}
