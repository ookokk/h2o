import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/const/device_size.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:h2o_flutter/src/view/register/widget/almost_done_button.dart';
import 'package:lottie/lottie.dart';

class AlmostDoneView extends ConsumerWidget {
  const AlmostDoneView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
        child: Scaffold(
      floatingActionButton: SizedBox(
        width: DeviceSize.kWidth(context) * 0.7,
        child: const AlmostDoneButton(),
      ),
      body: SizedBox(
        child: Center(
          child: Column(
            children: [
              Text(
                "kAlmostYouAre".tr(),
                textAlign: TextAlign.center,
                style: currentTheme.textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 24,
              ),
              Lottie.asset('assets/animations/almost.json',
                  animate: false, height: DeviceSize.kHeight(context) * 0.6),
            ],
          ),
        ),
      ),
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    ));
  }
}
