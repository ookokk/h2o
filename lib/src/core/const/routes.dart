import 'package:flutter/material.dart';
import 'package:h2o_flutter/src/view/history/view/history_view.dart';
import 'package:h2o_flutter/src/view/home/view/home_view.dart';
import 'package:h2o_flutter/src/view/profile/view/profile_view.dart';
import 'package:h2o_flutter/src/view/register/view/fifth_tab_view.dart';
import 'package:h2o_flutter/src/view/register/view/first_tab_view.dart';
import 'package:h2o_flutter/src/view/register/view/fourth_tab_view.dart';
import 'package:h2o_flutter/src/view/register/view/second_tab_view.dart';
import 'package:h2o_flutter/src/view/register/view/third_tab_view.dart';
import 'package:h2o_flutter/src/view/get_started/view/get_started_view.dart';
import 'package:h2o_flutter/src/view/splash/view/splash_view.dart';
import 'package:h2o_flutter/src/view/today/view/today_view.dart';

class Routes {
  //BASE
  static const String splash = '/splash';
  static const String getStarted = '/getStarted';
  //REGISTER
  static const String firstTab = '/first';
  static const String secondTab = '/second';
  static const String thirdTab = '/third';
  static const String fourthTab = '/fourth';
  static const String fifthTab = '/fifth';

  //HOME
  static const String home = '/home';
  static const String water = '/water';
  static const String progress = '/progress';
  static const String profile = '/profile';

  static final Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashView(),
    getStarted: (context) => const GetStartedView(),
    firstTab: (context) => const FirstTabView(),
    secondTab: (context) => const SecondTabView(),
    thirdTab: (context) => const ThirdTabView(),
    fourthTab: (context) => const FourthTabView(),
    fifthTab: (context) => const FifthTabView(),
    home: (context) => const HomeView(),
    water: (context) => const TodayView(),
    progress: (context) => const HistoryView(),
    profile: (context) => const ProfileView(),
  };
}
