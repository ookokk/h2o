import 'package:flutter/material.dart';
import 'package:h2o_flutter/src/view/register/view/first_tab_view.dart';
import 'package:h2o_flutter/src/view/register/view/fourth_tab_view.dart';
import 'package:h2o_flutter/src/view/register/view/second_tab_view.dart';
import 'package:h2o_flutter/src/view/register/view/third_tab_view.dart';
import 'package:h2o_flutter/src/view/get_started/view/get_started_view.dart';
import 'package:h2o_flutter/src/view/splash/view/splash_view.dart';

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
  static const String profile = '/profile';

  static final Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashView(),
    getStarted: (context) => const GetStartedView(),
    firstTab: (context) => const FirstTabView(),
    secondTab: (context) => const SecondTabView(),
    thirdTab: (context) => const ThirdTabView(),
    fourthTab: (context) => const FourthTabView(),
    //   home: (context) => const HomeView(),
  };
}
