import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_app/utils/constants.dart';
import 'package:e_commerce_app/view/user_sign_in/user_signin_page.dart';
import 'package:flutter/material.dart';

class SignUpWidgets{
    static FadeInUp signInNavigate(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 400),
      duration: const Duration(milliseconds: 1000),
      child: InkWell(
        onTap: () {
          nextScreenRemoveUntil(context, const UserSignInPage());
        },
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Already have an account? ",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const TextSpan(text: 'Sign In.'),
            ],
          ),
        ),
      ),
    );
  }
}