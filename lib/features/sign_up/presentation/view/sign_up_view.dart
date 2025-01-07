import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/theme/app_styles.dart';
import 'package:docdoc/core/widgets/cus_text_button.dart';
import 'package:docdoc/features/login/presentation/widgets/terms_and_conditions_text.dart';
import 'package:docdoc/features/sign_up/presentation/controller/sign_up_cubit/sign_up_cubit.dart';
import 'package:docdoc/features/sign_up/presentation/widgets/already_have_an_account.dart';
import 'package:docdoc/features/sign_up/presentation/widgets/sign_up_bloc_listener.dart';
import 'package:docdoc/features/sign_up/presentation/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

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
                  'Create Account',
                  style: AppStyles.font24BlueBold,
                ),
                verticalSpace(height: 8),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: AppStyles.font14GrayRegular,
                ),
                verticalSpace(height: 36),
                Column(
                  children: [
                    const SignUpForm(),
                    verticalSpace(height: 40),
                    CusTextButton(
                      buttonText: "Create Account",
                      textStyle: AppStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoSignUp(context);
                        print("#############");
                      },
                    ),
                    verticalSpace(height: 16),
                    const TermsAndConditionsText(),
                    verticalSpace(height: 30),
                    const AlreadyHaveAccountText(),
                    const SignUpBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignUp(BuildContext context) {
    if (BlocProvider.of<SignUpCubit>(context)
        .formKey
        .currentState!
        .validate()) {
      BlocProvider.of<SignUpCubit>(context).emitSignUpStates();
    }
  }
}
