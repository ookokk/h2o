import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  late ConnectivityResult _connectionStatus;
// rotalar set edildikten sonra bu sayfada yapılacaklar var
  @override
  void initState() {
    super.initState();
    _checkInternetConnectivity();
  }

  Future<void> _checkInternetConnectivity() async {
    final connectivity = Connectivity();
    _connectionStatus = await connectivity.checkConnectivity();

    if (_connectionStatus == ConnectivityResult.none) {
      _showNoInternetAlertDialog();
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        //   Navigator.pushNamed(context, Routes.getStarted);
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
                _checkInternetConnectivity();
              },
              child: const Text("Retry"),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
