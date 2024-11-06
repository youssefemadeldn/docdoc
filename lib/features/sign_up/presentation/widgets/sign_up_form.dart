import 'package:docdoc/core/helper/regex_helper.dart';
import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/widgets/cus_text_form_field.dart';
import 'package:docdoc/features/login/presentation/widgets/password_validation.dart';
import 'package:docdoc/features/sign_up/presentation/controller/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController =
        BlocProvider.of<SignUpCubit>(context).passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = RegexHelper.hasLowerCase(passwordController.text);
        hasUppercase = RegexHelper.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            RegexHelper.hasSpecialCharacter(passwordController.text);
        hasNumber = RegexHelper.hasNumber(passwordController.text);
        hasMinLength = RegexHelper.hasMinLength(passwordController.text, 8);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          CusTextFormField(
            hintText: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
            controller: BlocProvider.of<SignUpCubit>(context).nameController,
          ),
          verticalSpace(height: 18),
          CusTextFormField(
            hintText: 'Phone number',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !RegexHelper.isValidPhoneNumber(value)) {
                return 'Please enter a valid phone number';
              }
            },
            controller: BlocProvider.of<SignUpCubit>(context).phoneController,
          ),
          verticalSpace(height: 18),
          CusTextFormField(
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !RegexHelper.isValidEmail(value)) {
                return 'Please enter a valid email';
              }
            },
            controller: BlocProvider.of<SignUpCubit>(context).emailController,
          ),
          verticalSpace(height: 18),
          CusTextFormField(
            controller: context.read<SignUpCubit>().passwordController,
            hintText: 'Password',
            isObscureText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),
          verticalSpace(height: 18),
          CusTextFormField(
            controller:
                BlocProvider.of<SignUpCubit>(context).passwordConfirmController,
            hintText: 'Password Confirmation',
            isObscureText: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText =
                      !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(
                isPasswordConfirmationObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),
          verticalSpace(height: 24),
          PasswordValidation(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacter: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
