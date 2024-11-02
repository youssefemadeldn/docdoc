import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/theme/app_styles.dart';
import 'package:docdoc/core/widgets/cus_text_button.dart';
import 'package:docdoc/features/login/data/models/login_request_body_model.dart';
import 'package:docdoc/features/login/presentation/controller/cubit/login_cubit.dart';
import 'package:docdoc/features/login/presentation/widgets/dont_have_account_text.dart';
import 'package:docdoc/features/login/presentation/widgets/email_and_password.dart';
import 'package:docdoc/features/login/presentation/widgets/login_bloc_listener.dart';
import 'package:docdoc/features/login/presentation/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                Column(
                  children: [
                    const EmailAndPassword(),
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
                      onPressed: () {
                        validateThenLogin(context);
                      },
                    ),
                    verticalSpace(height: 16),
                    const TermsAndConditionsText(),
                    verticalSpace(height: 60),
                    const DontHaveAccountText(),
                    LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
    if (BlocProvider.of<LoginCubit>(context).formKey.currentState!.validate()) {
      BlocProvider.of<LoginCubit>(context).emitLoginState(
        loginRequestBodyModel: LoginRequestBodyModel(
          email: BlocProvider.of<LoginCubit>(context).emailController.text,
          password:
              BlocProvider.of<LoginCubit>(context).passwordController.text,
        ),
      );
    }
  }
}
