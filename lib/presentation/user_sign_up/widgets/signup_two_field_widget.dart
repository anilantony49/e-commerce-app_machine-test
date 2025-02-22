import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_app/core/utils/alerts_and_navigators.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/core/utils/validations.dart';
import 'package:e_commerce_app/presentation/bloc/user_sign_up/sign_up_bloc.dart';
import 'package:e_commerce_app/presentation/cubit/toggle_password/toggle_password_cubit.dart';
import 'package:e_commerce_app/presentation/user_sign_up/widgets/widgets.dart';
import 'package:e_commerce_app/widgets/custom_btn.dart';
import 'package:e_commerce_app/widgets/custom_txt_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpTwoFieldWidget extends StatefulWidget {
  const SignUpTwoFieldWidget({
    super.key,
    required this.email,
    required this.phoneNo,
    required this.fullName,
    required this.accountType,
  });

  final String email;
  final String phoneNo;
  final String fullName;
  final String accountType;

  @override
  State<SignUpTwoFieldWidget> createState() => _SignUpTwoFieldWidgetState();
}

class _SignUpTwoFieldWidgetState extends State<SignUpTwoFieldWidget> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: const Duration(milliseconds: 400),
      duration: const Duration(milliseconds: 1000),
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Username field
              CustomTxtFormField(
                hintText: 'Username',
                controller: userNameController,
                validator: (val) {
                  if (val!.length < 4) {
                    return 'Username should have at least 4 characters';
                  }
                  if (val.endsWith('.') || val.endsWith('_')) {
                    return "Username can't end with period or underscore";
                  }
                  if (!RegExp(r"^(?=.{4,20}$)(?![_.])[a-zA-Z0-9._]+(?<![_.])$")
                      .hasMatch(val)) {
                    return 'Username can only user letters, numbers, underscores and periods';
                  }
                  return null;
                },
              ),

              // Create password field
              kHeight(20),
              BlocBuilder<TogglePasswordCubit, bool>(
                builder: (context, state) {
                  return CustomTxtFormField(
                    hintText: 'Create password',
                    controller: passWordController,
                    validator: (val) {
                      if (!RegExp(passowrdRegexPattern).hasMatch(val!)) {
                        return 'Passwords should be 8 characters, at least one number and one special character';
                      }
                      return null;
                    },
                    obscureText: state,
                    suffix: GestureDetector(
                      onTap: () {
                        context.read<TogglePasswordCubit>().toggle();
                      },
                      child: Icon(
                        state ? Icons.visibility_off : Icons.visibility,
                        size: 20,
                        color:  Colors.grey,
                      ),
                    ),
                  );
                },
              ),
              kHeight(20),

              // Confirm passowrd field
              BlocBuilder<TogglePasswordCubit, bool>(
                builder: (context, state) {
                  return CustomTxtFormField(
                    hintText: 'Confirm password',
                    controller: confirmPasswordController,
                    validator: (val) {
                      if (!RegExp(passowrdRegexPattern).hasMatch(val!)) {
                        return 'Passwords should be 8 characters, at least one number and one special character';
                      }
                      return null;
                    },
                    obscureText: state,
                    suffix: GestureDetector(
                      onTap: () {
                        context.read<TogglePasswordCubit>().toggle();
                      },
                      child: Icon(
                          state ? Icons.visibility_off : Icons.visibility,
                          size: 20,
                          color: Colors.grey),
                    ),
                  );
                },
              ),
              kHeight(25),

              // Sign Up button
              BlocListener<SignUpBloc, SignUpState>(
                listener: signUpListener,
                child: CustomButton(
                  buttonText: 'Sign Up',
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (passWordController.text ==
                        confirmPasswordController.text) {
                      if (formKey.currentState!.validate()) {
                        context
                            .read<SignUpBloc>()
                            .add(UserOtpVerificationEvent(email: widget.email));
                      }
                    } else {
                      customSnackbar(
                        context,
                        "Passwords doesn't match",
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void signUpListener(BuildContext context, SignUpState state) {
    if (state is UserOtpSuccessState) {
      SignUpWidgets.validateEmail(
        context: context,
        fullName: widget.fullName,
        email: widget.email,
        phoneNo: widget.phoneNo,
        accountType: widget.accountType,
        otpController: otpController,
        username: userNameController.text,
        password: passWordController.text,
      );
    }
  }
}
