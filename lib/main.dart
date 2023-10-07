import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/generated/codegen_loader.g.dart';
import 'package:h2o_flutter/src/core/init/cache/init_locator.dart';
import 'package:h2o_flutter/src/core/init/lang/language_manager.dart';
import 'package:h2o_flutter/src/view/splash/view/splash_view.dart';
import 'src/core/const/routes.dart';
import 'src/core/init/theme/theme_provider.dart';

void main() {
  initLocator();
  runApp(EasyLocalization(
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: 'assets/lang',
      startLocale: LanguageManager.instance.turkishLocale,
      assetLoader: const CodegenLoader(),
      child: const ProviderScope(child: MyApp())));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      routes: Routes.routes,
      theme: currentTheme,
      darkTheme: ThemeProvider.darkTheme,
      home: const SplashView(),
    );
  }
}
