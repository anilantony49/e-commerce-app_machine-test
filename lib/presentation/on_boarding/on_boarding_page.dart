// ignore_for_file: use_build_context_synchronously

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:e_commerce_app/data/services/shared_preference.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/presentation/on_boarding/widgets/rotating_image.dart';
import 'package:e_commerce_app/presentation/user_sign_in/user_signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: Colors.black,
      child: GestureDetector(
        onVerticalDragUpdate: (dragUpdateDetails) {
          print('object');
          UserAuthStatus.saveUserinitialStatus(true);
          nextScreenRemoveUntil(context, const UserSignInPage());
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              const Spacer(),
              const LoginAssets(),
              const Spacer(),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'A platform to',
                      style: thinFontStyle(context),
                    ),
                    TextSpan(text: ' discover,', style: boldFontStyle(context)),
                    TextSpan(text: '\nshop,', style: boldFontStyle(context)),
                    TextSpan(text: ' and', style: thinFontStyle(context)),
                    TextSpan(text: ' connect ', style: boldFontStyle(context)),
                    TextSpan(text: ' with your', style: thinFontStyle(context)),
                    TextSpan(
                        text: ' favorite products ',
                        style: boldFontStyle(context)),
                    TextSpan(
                        text: ' effortlessly', style: thinFontStyle(context)),
                  ],
                ),
              ),
              kHeight(10),
              const Text('Swipe up to get started.'),
              const Spacer(),
              swipeDownWidget(context)
                  .animate(
                    onPlay: (controller) => controller.repeat(),
                  )
                  .shimmer(delay: 400.ms, duration: 1000.ms)
                  .shake(hz: 4, curve: Curves.easeInOutCubic)
                  .scaleXY(end: 1.1, duration: 600.ms)
                  .then(delay: 600.ms)
                  .scaleXY(end: 1 / 1.1),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget swipeDownWidget(BuildContext context) {
    return const SizedBox(
      height: 50,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Icon(Icons.keyboard_arrow_down, size: 30),
          Positioned(
            top: 20,
            child: Icon(Icons.keyboard_arrow_up, size: 20),
          ),
          Positioned(
            top: 35,
            child: Text(
              '●',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle thinFontStyle(BuildContext context) => TextStyle(
        fontFamily: mainFont,
        fontWeight: FontWeight.w300,
        fontSize: 30,
        color: Theme.of(context).colorScheme.primary,
      );

  TextStyle boldFontStyle(BuildContext context) => TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w800,
        fontFamily: mainFont,
        color: Theme.of(context).colorScheme.primary,
      );
}
