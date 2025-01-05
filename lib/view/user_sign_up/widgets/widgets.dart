import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_app/main_screen.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/utils/alerts_and_navigators.dart';
import 'package:e_commerce_app/utils/constants.dart';
import 'package:e_commerce_app/view/bloc/profile/profile_bloc.dart';
import 'package:e_commerce_app/view/bloc/user/user_bloc.dart';
import 'package:e_commerce_app/view/bloc/user_sign_up/sign_up_bloc.dart';
import 'package:e_commerce_app/view/cubit/toggle_password/toggle_password_cubit.dart';
import 'package:e_commerce_app/view/user_sign_in/user_signin_page.dart';
import 'package:e_commerce_app/widgets/custom_btn.dart';
import 'package:e_commerce_app/widgets/custom_txt_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpWidgets {
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
                style: TextStyle(color: Colors.black),
              ),
              const TextSpan(
                text: 'Sign In.',
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Future<dynamic> validateEmail({
    BuildContext? context,
    String? email,
    String? phoneNo,
    String? fullName,
    String? accountType,
    String? password,
    String? username,
    TextEditingController? otpController,
  }) {
    final GlobalKey<FormState> formKey = GlobalKey();

    return showDialog(
      context: context!,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(
            'Verification',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary),
          ),
          content: const Text(
              'A 6 - Digit OTP has been sent to your email address, enter it below to continue'),
          actions: [
            BlocConsumer<SignUpBloc, SignUpState>(
              listener: (context, state) {
                if (state is UserSignUpSuccessState) {
                  context.read<ProfileBloc>().add(ProfileInitialFetchEvent());
                  context.read<UserBloc>().add(FetchAllUserEvent());
                  // context.read<PostBloc>().add(PostInitialFetchEvent());
                  nextScreenRemoveUntil(context, const MainScreen());
                  // mySystemTheme(context);
                  context.read<TogglePasswordCubit>().reset();
                }
                if (state is UsernameExistsErrorState) {
                  debugPrint('Username already exists');
                  Navigator.pop(context);
                  customSnackbar(
                    context,
                    'Username already exists',
                  );
                }
                if (state is EmailExistsErrorState) {
                  debugPrint('Email already exists');
                  Navigator.pop(context);
                  customSnackbar(
                    context,
                    'Email already exists',
                  );
                }
                if (state is PhonenoExistsErrorState) {
                  Navigator.pop(context);
                  customSnackbar(
                    context,
                    'Phone number already exists',
                  );
                }
              },
              builder: (context, state) {
                return Column(
                  children: [
                    Form(
                      key: formKey,
                      child: CustomTxtFormField(
                        hintText: 'OTP',
                        controller: otpController,
                        validator: (val) {
                          if (state is UserOtpErrorState ||
                              state is UsernameExistsErrorState) {
                            return "Please enter a valid OTP";
                          }
                          if (val!.length < 2) {
                            return "Please enter a valid OTP";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
            kHeight(20),
            signUpButton(formKey, otpController, accountType, username,
                password, email, fullName, phoneNo, context),
          ],
        );
      },
    );
  }
}

Widget signUpButton(
    GlobalKey<FormState> formKey,
    TextEditingController? otpController,
    String? accountType,
    String? username,
    String? password,
    String? email,
    String? fullName,
    String? phoneNo,
    BuildContext context) {
  return CustomButton(
    buttonText: 'Sign Up',
    onPressed: () {
      FocusScope.of(context).unfocus();
      if (formKey.currentState!.validate()) {
        final user = UserModel(
          accountType: accountType,
          username: username,
          password: password,
          email: email,
          fullName: fullName,
          phoneNumber: int.parse(phoneNo ?? '0'),
          otp: otpController!.text,
        );
        context.read<SignUpBloc>().add(UserSignUpEvent(user: user));
      }
    },
  );
}
