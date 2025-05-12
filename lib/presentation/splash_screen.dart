import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pretium_app/constants/colors.dart';
import 'package:pretium_app/presentation/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Start timer after build
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
    return Scaffold(
      backgroundColor: AppColors.primary, // Deep green background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo from assets
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(
                'assets/logo.png',
              ), // Replace with your actual logo asset if different
            ),
            const SizedBox(height: 16),
            // PRETIUM text
            const Text(
              'PRETIUM',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
