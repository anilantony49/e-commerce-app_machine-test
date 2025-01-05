import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/presentation/user_sign_up/user_signup_one.dart';
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
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text: 'Sign Up.',
                style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
