// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce_app/others/main_screen.dart';
import 'package:e_commerce_app/data/services/shared_preference.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/presentation/on_boarding/on_boarding_page.dart';
import 'package:e_commerce_app/presentation/user_sign_in/user_signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    checkUserStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: const Text(
          'Cartify.',
          style: TextStyle(fontSize: 35),
        )
            .animate()
            .shimmer(delay: 400.ms, duration: 1000.ms)
            .shake(hz: 4, curve: Curves.easeInOutCubic)
            .scaleXY(end: 1.1, duration: 600.ms)
            .then(delay: 600.ms)
            .scaleXY(end: 1 / 1.1),
      ),
    );
  }

  Future<void> checkUserStatus() async {
    final userOnInitial = await UserAuthStatus.isUserOnInitial();
    final userSignIn = await UserAuthStatus.getUserStatus();
    if (userOnInitial == false) {
      nextScreen(context, const OnBoardingPage());
    } else {
      if (userSignIn == false) {
        await Future.delayed(2500.ms);
        nextScreenRemoveUntil(context, const UserSignInPage());
      } else {
        await Future.delayed(2500.ms);
        nextScreenRemoveUntil(context, const MainScreen());
      }
    }
  }
}
