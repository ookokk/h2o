import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/const/device_size.dart';
import 'package:h2o_flutter/src/core/init/cache/hive_manager.dart';
import 'package:h2o_flutter/src/core/init/cache/locator.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:h2o_flutter/src/view/splash/viewmodel/splash_view_model.dart';
import 'package:lottie/lottie.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> with SplashViewModel {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      final dataBox = getIt.get<IHiveManager>();
      final isRegistered = dataBox.user.get('isRegistered');
      if (isRegistered == false) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/register', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
        child: Scaffold(
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      body: SizedBox(
        height: DeviceSize.kHeight(context) * 0.9,
        width: DeviceSize.kWidth(context) * 0.9,
        child: Center(
          child: Lottie.asset('assets/animations/circle_water.json',
              height: DeviceSize.kHeight(context) * 0.3),
        ),
      ),
    ));
  }
}
