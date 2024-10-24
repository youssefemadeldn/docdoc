import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/theme/app_styles.dart';
import 'package:docdoc/core/widgets/cus_text_button.dart';
import 'package:docdoc/core/widgets/cus_text_form_field.dart';
import 'package:docdoc/features/login/presentation/widgets/dont_have_account_text.dart';
import 'package:docdoc/features/login/presentation/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back",
                  style: AppStyles.font24BlueBold,
                ),
                verticalSpace(height: 8),
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: AppStyles.font14GreyRegular,
                ),
                verticalSpace(height: 32),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CusTextFormField(hintText: 'Email'),
                      verticalSpace(height: 18),
                      CusTextFormField(
                        hintText: 'Password',
                        isObscureText: isObscureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          child: Icon(isObscureText
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                      verticalSpace(height: 24),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          'Forgot Password?',
                          style: AppStyles.font12MainBlueRegular,
                        ),
                      ),
                      verticalSpace(height: 40),
                      CusTextButton(
                        buttonText: 'Login',
                        horizontalPadding: 10,
                        verticalPadding: 5,
                        textStyle: AppStyles.font16WhiteSemiBold,
                        onPressed: () {},
                      ),
                      verticalSpace(height: 16),
                      const TermsAndConditionsText(),
                      verticalSpace(height: 60),
                      const DontHaveAccountText(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
