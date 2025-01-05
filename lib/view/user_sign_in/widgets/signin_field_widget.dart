// ignore_for_file: use_build_context_synchronously

import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_app/main_screen.dart';
import 'package:e_commerce_app/utils/alerts_and_navigators.dart';
import 'package:e_commerce_app/utils/constants.dart';
import 'package:e_commerce_app/view/bloc/user_sign_in/sign_in_bloc.dart';
import 'package:e_commerce_app/view/cubit/toggle_password/toggle_password_cubit.dart';
import 'package:e_commerce_app/widgets/custom_btn.dart';
import 'package:e_commerce_app/widgets/custom_txt_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInFieldWidget extends StatefulWidget {
  const SignInFieldWidget({super.key});

  @override
  State<SignInFieldWidget> createState() => _SignInFieldWidgetState();
}

class _SignInFieldWidgetState extends State<SignInFieldWidget> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: signInListener,
      builder: (context, state) {
        return FadeInDown(
          delay: const Duration(milliseconds: 400),
          duration: const Duration(milliseconds: 1000),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 40, 40, 30),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome back!',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        kHeight(10),
                        const Text(
                          "Enter your login details to continue.",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  kHeight(25),
                  // Username field
                  CustomTxtFormField(
                    controller: usernameController,
                    hintText: 'Username',
                    validator: (value) {
                      if (value!.length < 4) {
                        return 'Username should not be empty';
                      }
                      return null;
                    },
                  ),
                  kHeight(20),

                  // Password field
                  BlocBuilder<TogglePasswordCubit, bool>(
                    builder: (context, state) {
                      return CustomTxtFormField(
                        controller: passwordController,
                        hintText: 'Password',
                        suffix: GestureDetector(
                          onTap: () {
                            context.read<TogglePasswordCubit>().toggle();
                          },
                          child: Icon(
                            state ? Icons.visibility : Icons.visibility_off,
                            size: 20,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        obscureText: state,
                        validator: (value) {
                          if (value!.length < 4) {
                            return 'Password should not be empty';
                          }
                          return null;
                        },
                      );
                    },
                  ),
                  kHeight(25),

                  // Sign in button
                  CustomButton(
                    buttonText: 'Sign In',
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if (formKey.currentState!.validate()) {
                        context.read<SignInBloc>().add(
                              UserSignInEvent(
                                username: usernameController.text,
                                password: passwordController.text,
                              ),
                            );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void signInListener(BuildContext context, SignInState state) {
    if (state is InvalidUsernameErrorState) {
      customSnackbar(
        context,
        "Username doesn't exist",
      );
    }
    if (state is InvalidPasswordErrorState) {
      customSnackbar(
        context,
        "Incorrect password",
      );
    }

    if (state is UserSignInSuccessState) {
      nextScreenRemoveUntil(context, const MainScreen());

      context.read<TogglePasswordCubit>().reset();
    }
    if (state is UserSignInErrorState) {
      customSnackbar(
        context,
        'Please try again after some times',
      );
    }
  }
}
