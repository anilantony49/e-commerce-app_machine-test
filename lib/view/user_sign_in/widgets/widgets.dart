import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_app/utils/constants.dart';
import 'package:e_commerce_app/view/user_sign_up/user_signup_one.dart';
import 'package:flutter/material.dart';

class SignInWidgets {
  static InkWell signUpNavigate(context) {
    return InkWell(
      onTap: () => nextScreen(context, const UserSignUpPageOne()),
      child: FadeInUp(
        delay: const Duration(milliseconds: 700),
        duration: const Duration(milliseconds: 1000),
        child: Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            children: [
              TextSpan(
                text: "Don't have an account yet? ",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const TextSpan(
                text: 'Sign Up.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
