import 'package:base_project/presentations/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: Center(
        child: Image.asset(
          "assets/ar.png",
          width: Get.width * 0.45,
        ),
      ),
    );
  }

  Future<void> initializeApp() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAll(const HomeView());
  }
}
