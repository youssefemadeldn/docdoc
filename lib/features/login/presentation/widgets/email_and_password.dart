import 'package:docdoc/core/helper/regex_helper.dart';
import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/widgets/cus_text_form_field.dart';
import 'package:docdoc/features/login/presentation/controller/cubit/login_cubit.dart';
import 'package:docdoc/features/login/presentation/widgets/password_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;
  late TextEditingController passwordController;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacter = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setUpPasswordControllerListener();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    passwordController.dispose();
    super.dispose();
  }

  void setUpPasswordControllerListener() {
    passwordController.addListener(
      () => setState(() {
        hasLowerCase = RegexHelper.hasLowerCase(passwordController.text);
        hasUpperCase = RegexHelper.hasUpperCase(passwordController.text);
        hasSpecialCharacter =
            RegexHelper.hasSpecialCharacter(passwordController.text);
        hasNumber = RegexHelper.hasNumber(passwordController.text);
        hasMinLength = RegexHelper.hasMinLength(passwordController.text, 8);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<LoginCubit>(context).formKey,
      child: Column(
        children: [
          CusTextFormField(
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !RegexHelper.isValidEmail(value)) {
                return 'please enter a valid email';
              }
            },
            controller: BlocProvider.of<LoginCubit>(context).emailController,
          ),
          verticalSpace(height: 18),
          CusTextFormField(
            hintText: 'Password',
            controller: BlocProvider.of<LoginCubit>(context).passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter a valid password';
              }
            },
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child:
                  Icon(isObscureText ? Icons.visibility_off : Icons.visibility),
            ),
          ),
          verticalSpace(height: 24),
          PasswordValidation(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacter: hasSpecialCharacter,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }
}
