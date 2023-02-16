import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tec/constants/my_colors.dart';
import 'package:tec/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3))
        .then((value) => {Get.offAndToNamed(NamedRoutes.routeMainScreen)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/splash-screen.png",
                height: 64,
              ),
              const SizedBox(
                height: 32,
              ),
              const SpinKitFadingCube(color: SolidColors.primaryColor, size: 50)
            ],
          ),
        ),
      ),
    );
  }
}
