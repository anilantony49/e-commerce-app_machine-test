import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/presentation/bloc/user_sign_in/sign_in_bloc.dart';
import 'package:e_commerce_app/presentation/bloc/user_sign_up/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    this.onPressed,
  });

  final String buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
        color: Appcolor.primary,
        onPressed: onPressed,
        child: BlocBuilder<SignInBloc, SignInState>(
          builder: (context, signInState) {
            return BlocBuilder<SignUpBloc, SignUpState>(
              builder: (context, signUpState) {
                if (signInState is UserSignInLoadingState ||
                    signUpState is UserOtpLoadingState ||
                    signUpState is UserSignUpLoadingState) {
                  return SizedBox(
                    height: 22,
                    width: 22,
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    ),
                  );
                } else {
                  return FadeInUp(
                    delay: const Duration(milliseconds: 400),
                    duration: const Duration(milliseconds: 1000),
                    child: Text(
                      buttonText,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
