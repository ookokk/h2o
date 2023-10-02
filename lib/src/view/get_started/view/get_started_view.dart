import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/const/device_size.dart';
import 'package:h2o_flutter/src/core/const/strings.dart';
import 'package:h2o_flutter/src/core/init/theme/theme_provider.dart';
import 'package:h2o_flutter/src/view/get_started/widget/get_started_button.dart';

class GetStartedView extends ConsumerWidget {
  const GetStartedView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
        child: Scaffold(
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: DeviceSize.kHeight(context),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/get_started.png',
                  height: DeviceSize.kHeight(context) * 0.5,
                ),
                Text(Strings.kGetSAppName,
                    style: currentTheme.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold)),
                Text(Strings.kGetSNeverFor,
                    style: currentTheme.textTheme.displaySmall),
                const SizedBox(
                  height: 155,
                ),
                GetStartedButton(
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  text: Strings.kGetSBtn,
                ),
                const SizedBox(
                  height: 35,
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
