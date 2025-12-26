import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tanzem/feature/OnBoarding/view/onboarding_view.dart';
import '../../../Core/Utils/app.colors.dart';
import '../../../Core/Utils/app.images.dart';
import 'circular_gradiant_opacity_container.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) =>  OnBoardingView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primary,
              Color(0xFFD6F5F2),
              Color(0xFFD6F5F2),
              Color(0xFFD6F5F2),
              AppColors.primary,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.appPLogo2,
              width: 320,
            ),
          ],
        ),
      ),
    );
  }
}
