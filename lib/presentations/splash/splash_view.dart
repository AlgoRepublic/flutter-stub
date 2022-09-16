import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../authentication/view/signup_view.dart';

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
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
          child: Image.asset(
        "assets/ysells_logo.png",
        width: Get.width * 0.45,
      )),
    );
  }

  initializeApp() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAll(const SignupView());
  }
}
