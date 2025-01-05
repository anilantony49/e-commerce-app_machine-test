// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce_app/main_screen.dart';
import 'package:e_commerce_app/services/shared_preference.dart';
import 'package:e_commerce_app/utils/constants.dart';
import 'package:e_commerce_app/view/user_sign_in/user_signin_page.dart';
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
          'Tweel.',
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
    // final userOnInitial = await UserAuthStatus.isUserOnInitial();
    final userSignIn = await UserAuthStatus.getUserStatus();

    if (userSignIn == false) {
      await Future.delayed(const Duration(seconds: 7));
      nextScreenRemoveUntil(context, const UserSignInPage());
    } else {
      await Future.delayed(const Duration(seconds: 7));
      nextScreenRemoveUntil(context, const MainScreen());
    }
  }
}
