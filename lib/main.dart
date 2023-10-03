import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/init/cache/locator.dart';
import 'package:h2o_flutter/src/view/splash/view/splash_view.dart';
import 'src/core/const/routes.dart';
import 'src/core/init/theme/theme_provider.dart';

void main() async {
  initLocator();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: Routes.routes,
      theme: currentTheme,
      home: const SplashView(),
    );
  }
}
