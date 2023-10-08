import 'package:flutter/material.dart';
import 'package:h2o_flutter/src/view/alarm/view/alarm_view.dart';
import 'package:h2o_flutter/src/view/choose_language/view/choose_language_view.dart';
import 'package:h2o_flutter/src/view/home/view/home_view.dart';
import 'package:h2o_flutter/src/view/register/view/almost_done_view.dart';
import 'package:h2o_flutter/src/view/register/view/fifth_tab_view.dart';
import 'package:h2o_flutter/src/view/register/view/first_tab_view.dart';
import 'package:h2o_flutter/src/view/register/view/fourth_tab_view.dart';
import 'package:h2o_flutter/src/view/register/view/register_view.dart';
import 'package:h2o_flutter/src/view/register/view/second_tab_view.dart';
import 'package:h2o_flutter/src/view/register/view/third_tab_view.dart';
import 'package:h2o_flutter/src/view/get_started/view/get_started_view.dart';
import 'package:h2o_flutter/src/view/settings/view/settings_view.dart';
import 'package:h2o_flutter/src/view/splash/view/splash_view.dart';
import 'package:h2o_flutter/src/view/today/view/today_view.dart';

class Routes {
  //BASE
  static const String splash = '/splash';
  static const String getStarted = '/getStarted';
  static const String chooseLanguage = '/choose';
  //REGISTER
  static const String register = '/register';
  static const String firstTab = '/first';
  static const String secondTab = '/second';
  static const String thirdTab = '/third';
  static const String fourthTab = '/fourth';
  static const String fifthTab = '/fifth';
  static const String almostDone = '/almost';
  //HOME
  static const String home = '/home';
  static const String water = '/water';
  static const String progress = '/progress';
  static const String settings = '/settings';
  static const String alarm = '/alarm';

  static final Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashView(),
    getStarted: (context) => const GetStartedView(),
    firstTab: (context) => const FirstTabView(),
    secondTab: (context) => const SecondTabView(),
    thirdTab: (context) => const ThirdTabView(),
    fourthTab: (context) => const FourthTabView(),
    fifthTab: (context) => const FifthTabView(),
    almostDone: (context) => const AlmostDoneView(),
    home: (context) => const HomeView(),
    water: (context) => const TodayView(),
    settings: (context) => const SettingsView(),
    register: (context) => RegisterView(),
    alarm: (context) => const AlarmView(),
    chooseLanguage: (context) => const ChooseLanguageView(),
  };
}
