import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h2o_flutter/src/core/init/cache/hive_manager.dart';
import 'package:h2o_flutter/src/core/init/cache/init_locator.dart';
import 'package:h2o_flutter/src/view/splash/view/splash_view.dart';

mixin SplashViewModel on ConsumerState<SplashView> {
  late ConnectivityResult _connectionStatus;

  @override
  void initState() {
    checkInternetConnectivity();
    super.initState();
  }

  Future<void> checkInternetConnectivity() async {
    final connectivity = Connectivity();
    _connectionStatus = await connectivity.checkConnectivity();

    if (_connectionStatus == ConnectivityResult.none) {
      _showNoInternetAlertDialog();
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        final dataBox = getIt.get<IHiveManager>();
        final isRegistered = dataBox.user.get('isRegistered');
        if (isRegistered == false) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/choose', (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        }
      });
    }
  }

  void _showNoInternetAlertDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("No Internet Connection"),
          content: const Text(
              "Please check your internet connection and try again."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                checkInternetConnectivity();
              },
              child: const Text("Retry"),
            ),
          ],
        );
      },
    );
  }
}
